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
    context 'valid request' do
      subject { response }

      before do
        allow(WeatherApi::Api).to receive(:get_forecast).and_return(WeatherApi::Forecast.new)
        get '/forecast/search'
      end

      it { is_expected.to have_http_status(:success) }
      it { is_expected.to render_template('forecast/show') }
      it { expect(assigns(:forecast).class.name).to eq('WeatherApi::Forecast') }
    end

    context 'invalid request' do
      subject { response }

      before do
        allow(WeatherApi::Api).to receive(:get_forecast).and_raise(StandardError.new('Bad stuff'))
        get '/forecast/search'
      end

      it { is_expected.to redirect_to(forecast_path) }

      it 'is expected to set a flash alert' do
        expect(flash[:alert]).to eq 'Bad stuff'
      end
    end
  end
end
