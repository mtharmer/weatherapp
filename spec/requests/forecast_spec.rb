# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Forecasts', type: :request do
  describe 'GET /forecast' do
    it 'returns http success' do
      get '/forecast'
      expect(response).to have_http_status(:success)
    end
  end
end
