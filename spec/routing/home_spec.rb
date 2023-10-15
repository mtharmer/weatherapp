# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HomeController, type: :routing do
  describe 'routing' do
    it { is_expected.to route(:get, '/').to('home#index') }
  end
end
