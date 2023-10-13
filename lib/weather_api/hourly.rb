# frozen_string_literal: true

module WeatherApi
  class Hourly
    include ActiveModel::Model

    attr_accessor :time,
                  :cloud_base,
                  :cloud_ceiling,
                  :cloud_cover,
                  :dew_point,
                  :evapotranspiration,
                  :freezing_rain_intensity,
                  :humidity,
                  :ice_accumulation,
                  :ice_accumulation_lwe,
                  :precipitation_probability,
                  :pressure_surface_level,
                  :rain_accumulation,
                  :rain_accumulation_lwe,
                  :rain_intensity,
                  :sleet_accumulation,
                  :sleet_accumulation_lwe,
                  :sleet_intensity,
                  :snow_accumulation,
                  :snow_accumulation_lwe,
                  :snow_intensity,
                  :temperature,
                  :temperature_apparent,
                  :uv_health_concern,
                  :uv_index,
                  :visibility,
                  :weather_code,
                  :wind_direction,
                  :wind_gust,
                  :wind_speed
  end
end
