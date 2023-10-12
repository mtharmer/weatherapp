# frozen_string_literal: true

class ForecastController < ApplicationController
  def show; end

  # TODO: Modify this with hotwire/turbo to update a partial on the page
  def search
    location = params[:location]
    Rails.logger.debug location
    @forecast = Forecast.new({ temperature: 72.3 })
    render template: 'forecast/show'
  end
end
