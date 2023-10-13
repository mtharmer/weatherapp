# frozen_string_literal: true

class ForecastController < ApplicationController
  # include WeatherApi::Api
  def show; end

  # TODO: Modify this with hotwire/turbo to update a partial on the page
  def search
    @forecast = WeatherApi::Api.get_forecast(params[:location])
    render template: 'forecast/show'
  end
end
