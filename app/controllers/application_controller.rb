# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def verify_location
    session.dig(:location, 'lat') && session.dig(:location, 'lon')
  end

  def retrieve_lat_lon
    { lat: session.dig(:location, 'lat'), lon: session.dig(:location, 'lon') }
  end
end
