# frozen_string_literal: true

class LocationController < ApplicationController
  def search
    session[:location] = WeatherApi::Api.search_location(params[:location])
    redirect_to weather_path
  end
end
