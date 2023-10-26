# frozen_string_literal: true

class WeatherController < ApplicationController
  def show
    return flash[:alert] = I18n.t('nolocation') unless verify_location

    coords = retrieve_lat_lon

    @current = current_cache(coords[:lat], coords[:lon])
  rescue StandardError => e
    flash[:alert] = e.message
  end

  def current_cache(lat, lon)
    Rails.cache.fetch("#{lat}/#{lon}/current", expires_in: 15.minutes) do
      WeatherApi::Api.get_current(lat, lon)
    end
  end
end
