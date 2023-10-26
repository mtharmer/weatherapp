# frozen_string_literal: true

module WeatherApi
  class ThreeHourItem
    include ActiveModel::Model

    attr_accessor(*%i[
                    dt
                    main_temp
                    main_feels_like
                    main_temp_min
                    main_temp_max
                    main_pressure
                    main_sea_level
                    main_grnd_level
                    main_humidity
                    main_temp_kf
                    weather
                    clouds_all
                    wind_speed
                    wind_deg
                    wind_gust
                    visibility
                    pop
                    rain_3h
                    snow_3h
                    sys_pod
                    dt_txt
                  ])
  end
end
