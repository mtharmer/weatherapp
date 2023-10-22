# frozen_string_literal: true

class ForecastController < ApplicationController
  # include WeatherApi::Api
  def show; end

  # TODO: Modify this with hotwire/turbo to update a partial on the page
  def search
    @forecast = WeatherApi::Api.get_forecast(params[:location])
    render :show
  rescue StandardError => e
    flash.clear
    redirect_to forecast_path, alert: e.message
  end
end
