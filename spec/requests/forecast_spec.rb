# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Forecasts', type: :request do
  describe 'GET /forecast' do
    subject { response }

    before { get '/forecast' }

    it { is_expected.to have_http_status(:success) }
    it { is_expected.to render_template('forecast/show') }
  end

  describe 'GET /forecast/search' do
    subject { response }

    before do
      allow(WeatherApi::Api).to receive(:get_forecast).and_return(WeatherApi::Forecast.new)
      get '/forecast/search'
    end

    it { is_expected.to have_http_status(:success) }
    it { is_expected.to render_template('forecast/show') }
    it { expect(assigns(:forecast).class.name).to eq('WeatherApi::Forecast') }
  end
end
