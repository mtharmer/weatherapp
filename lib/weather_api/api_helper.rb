# frozen_string_literal: true

module WeatherApi
  module ApiHelper
    class << self
      def translate_to_class(data, class_name)
        return [] unless data[class_name]

        data[class_name].map do |item|
          WeatherApi.const_get(class_name.classify).new(item)
        end
      end

      def single_weather_item(data)
        data['weather'] = data['weather'][0] if data['weather'] && data['weather'][0]
        data
      end

      def attrs(class_name)
        WeatherApi.const_get(class_name).instance_methods.each_with_object([]) do |key, acc|
          acc << key.to_s.gsub(/=$/, '') if key.match(/\w=$/)
        end
      end

      def flatten_hash(data)
        data.each_with_object({}) do |(key, val), original_hash|
          if val.is_a? Hash
            flatten_hash(val).each { |h_key, h_val| original_hash["#{key}_#{h_key}"] = h_val }
          elsif val.is_a? Array
            original_hash[key] = val.map { |item| flatten_hash(item) }
          else
            original_hash[key] = val
          end
        end
      end

      def convert_to_weather_summary(item)
        w = WeatherSummary.new
        w.attributes = item.select { |k, _v| attrs('WeatherSummary').include?(k.to_s) }
        w
      end

      def convert_to_list_with_weather_summary(data)
        data.map do |item|
          hr_item = ThreeHourItem.new
          hr_item.attributes = item.select { |k, _v| attrs('ThreeHourItem').include?(k.to_s) }
          hr_item.weather = hr_item.weather.map { |w| convert_to_weather_summary(w) }
          hr_item
        end
      end

      def flatten_handler(data, class_name)
        flatten_hash(data).select { |k, _v| attrs(class_name).include?(k.to_s) }
      end

      def format_3_hr_forecast_data(data)
        forecast = ThreeHourForecast.new
        forecast.attributes = flatten_handler(data, 'ThreeHourForecast')
        forecast.list = convert_to_list_with_weather_summary(forecast.list)
        forecast
      end

      def format_current_data(data)
        cur = Current.new
        cur.attributes = flatten_handler(data, 'Current')
        cur.weather = cur.weather.map { |item| convert_to_weather_summary(item) }
        cur
      end

      def format_location_search(data)
        location_data = data[0] || data
        return nil unless location_data

        Location.new(location_data)
      end
    end
  end
end
