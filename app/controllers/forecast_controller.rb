# frozen_string_literal: true

class ForecastController < ApplicationController
  def show
    return flash[:alert] = I18n.t('nolocation') unless verify_location

    coords = retrieve_lat_lon

    @forecast = forecast_cache(coords[:lat], coords[:lon])
  rescue StandardError => e
    flash[:alert] = e.message
  end

  def forecast_cache(lat, lon)
    Rails.cache.fetch("#{lat}/#{lon}/forecast", expires_in: 15.minutes) do
      WeatherApi::Api.get_3_hr_forecast(lat, lon)
    end
  end
end
