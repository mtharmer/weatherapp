# frozen_string_literal: true

module WeatherApi
  class Forecast
    include ActiveModel::Model

    attr_accessor :minutely, :hourly, :daily
  end
end
