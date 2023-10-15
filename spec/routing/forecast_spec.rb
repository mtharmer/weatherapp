# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ForecastController, type: :routing do
  describe 'routing' do
    it { is_expected.to route(:get, '/forecast').to('forecast#show') }
    it { is_expected.to route(:get, '/forecast/search').to('forecast#search') }
  end
end
