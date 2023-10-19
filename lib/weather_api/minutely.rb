# frozen_string_literal: true

module WeatherApi
  class Minutely
    include ActiveModel::Model

    attr_accessor(*%i[time
                      cloud_base
                      cloud_ceiling
                      cloud_cover
                      dew_point
                      freezing_rain_intensity
                      humidity
                      precipitation_probability
                      pressure_surface_level
                      rain_intensity
                      sleet_intensity
                      snow_intensity
                      temperature
                      temperature_apparent
                      uv_health_concern
                      uv_index
                      visibility
                      weather_code
                      wind_direction
                      wind_gust
                      wind_speed])
  end
end
