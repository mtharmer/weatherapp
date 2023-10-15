# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Devise::SessionsController, type: :routing do
  describe 'routing' do
    it { is_expected.to route(:get,     '/auth/sign_in').to('devise/sessions#new')      }
    it { is_expected.to route(:post,    '/auth/sign_in').to('devise/sessions#create')   }
    it { is_expected.to route(:delete,  '/auth/sign_out').to('devise/sessions#destroy') }
  end
end
