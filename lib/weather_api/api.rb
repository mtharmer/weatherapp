# frozen_string_literal: true

require 'uri'
require 'net/http'

module WeatherApi
  module Api
    class << self
      BASE_URI = ENV.fetch('WEATHER_API_URL', nil)
      API_KEY = ENV.fetch('WEATHER_API_KEY', nil)
      def get_forecast(location)
        url = URI("#{BASE_URI}forecast")
        url.query = URI.encode_www_form({ location: location, apikey: API_KEY })
        response_body = get_request(url)
        format_forecast_data(response_body)
      end

      private

      def get_request(url)
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true

        request = Net::HTTP::Get.new(url)
        request['accept'] = 'application/json'

        response = http.request(request)
        JSON.parse(response.body).deep_transform_keys!(&:underscore)
      end

      def flatten_response_values(data)
        data.map { |dh| dh.merge!(dh.delete('values')) }
      end

      def translate(data, klass)
        flat_data = flatten_response_values(data['timelines'][klass])
        flat_data.map { |item| WeatherApi.const_get(klass.classify).new(item) }
      end

      def format_forecast_data(data)
        Forecast.new(
          minutely: translate(data, 'minutely'),
          hourly: translate(data, 'hourly'),
          daily: translate(data, 'daily')
        )
      end
    end
  end
end
