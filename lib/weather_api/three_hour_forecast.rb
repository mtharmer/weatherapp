# frozen_string_literal: true

module WeatherApi
  class ThreeHourForecast
    include ActiveModel::Model

    attr_accessor(*%i[
                    cod
                    message
                    cnt
                    list
                    city_id
                    city_name
                    city_coord_lat
                    city_coord_lon
                    city_country
                    city_population
                    city_timezone
                    city_sunrise
                    city_sunset
                  ])
  end
end
