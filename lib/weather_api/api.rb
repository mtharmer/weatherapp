# frozen_string_literal: true

require 'uri'
require 'net/http'

module WeatherApi
  module Api
    class << self
      include WeatherApi::ApiHelper
      BASE_URI = ENV.fetch('WEATHER_API_URL', nil)
      API_KEY = ENV.fetch('WEATHER_API_KEY', nil)

      def get_3_hr_forecast(lat = nil, lon = nil)
        raise ArgumentError, 'Location is required' if lat.nil? || lon.nil?

        url = URI("#{BASE_URI}/data/2.5/forecast")
        url.query = URI.encode_www_form({ lat: lat, lon: lon, appid: API_KEY, units: 'imperial' })
        ApiHelper.format_3_hr_forecast_data(get_request(url))
      end

      def get_current(lat = nil, lon = nil)
        raise ArgumentError, 'Location is required' if lat.nil? || lon.nil?

        url = URI("#{BASE_URI}/data/2.5/weather")
        url.query = URI.encode_www_form({ lat: lat, lon: lon, appid: API_KEY, units: 'imperial' })
        ApiHelper.format_current_data(get_request(url))
      end

      def search_location(query)
        query =~ /^\d{5}$/ ? search_by_zip(query) : search_by_name(query)
      end

      private

      def search_by_name(query)
        query.gsub!(/,\s+/, ',') if query.match(/,\s+/)
        query.gsub!(/\s/, '%20') if query.match(/\s/)
        query += ',US' if query.split(',').length < 3
        url = URI("#{BASE_URI}/geo/1.0/direct?q=#{query}&appid=#{API_KEY}")
        ApiHelper.format_location_search(get_request(url))
      end

      def search_by_zip(query)
        puts "Searching by zip\n\n\n"
        url = URI("#{BASE_URI}/geo/1.0/zip?zip=#{query},US&appid=#{API_KEY}")
        ApiHelper.format_location_search(get_request(url))
      end

      def get_request(url)
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true

        request = Net::HTTP::Get.new(url)
        request['accept'] = 'application/json'

        res = http.request(request)
        raise StandardError, "Something went wrong - the server responded with #{res.code}" if res.code >= '400'

        JSON.parse(res.body)
      end
    end
  end
end
