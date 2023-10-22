# frozen_string_literal: true

require 'uri'
require 'net/http'

module WeatherApi
  module Api
    class << self
      BASE_URI = ENV.fetch('WEATHER_API_URL', nil)
      API_KEY = ENV.fetch('WEATHER_API_KEY', nil)

      def get_forecast(location = nil)
        raise ArgumentError, 'Location is required' if location.blank?

        url = URI("#{BASE_URI}forecast")
        url.query = URI.encode_www_form({ location: format_location(location), apikey: API_KEY, units: 'imperial' })
        format_forecast_data(get_request(url))
      end

      private

      def format_location(location)
        location =~ /^\d{5}$/ ? "#{location} US" : location
      end

      def get_request(url)
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true

        request = Net::HTTP::Get.new(url)
        request['accept'] = 'application/json'

        res = http.request(request)
        raise StandardError, "Something went wrong - the server responded with #{res.code}" if res.code >= '400'

        JSON.parse(res.body).deep_transform_keys!(&:underscore)
      end

      def flatten_response_values(data)
        data.map { |dh| dh.merge!(dh.delete('values')) }
      end

      def translate_to_class(data, class_name)
        return [] unless data['timelines'] && data.dig('timelines', class_name)

        flatten_response_values(data['timelines'][class_name]).map do |item|
          WeatherApi.const_get(class_name.classify).new(item)
        end
      end

      def format_forecast_data(data)
        Forecast.new(
          minutely: translate_to_class(data, 'minutely'),
          hourly: translate_to_class(data, 'hourly'),
          daily: translate_to_class(data, 'daily')
        )
      end
    end
  end
end
