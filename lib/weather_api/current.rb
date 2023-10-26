# frozen_string_literal: true

module WeatherApi
  class Current
    include ActiveModel::Model

    attr_accessor(*%i[
                    dt
                    coord_lat
                    coord_lon
                    weather
                    main_temp
                    main_feels_like
                    main_temp_min
                    main_temp_max
                    main_pressure
                    main_humidity
                    main_sea_level
                    main_grnd_level
                    visibility
                    wind_speed
                    wind_deg
                    wind_gust
                    clouds_all
                    rain_1h
                    rain_3h
                    snow_1h
                    snow_3h
                    sys_country
                    sys_sunrise
                    sys_sunset
                    timezone
                    id
                    name
                  ])
  end
end
