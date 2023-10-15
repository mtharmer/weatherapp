# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Devise::PasswordsController, type: :routing do
  describe 'routing' do
    it { is_expected.to route(:get,   '/auth/password/new').to('devise/passwords#new') }
    it { is_expected.to route(:get,   '/auth/password/edit').to('devise/passwords#edit') }
    it { is_expected.to route(:patch, '/auth/password').to('devise/passwords#update')  }
    it { is_expected.to route(:put,   '/auth/password').to('devise/passwords#update')  }
    it { is_expected.to route(:post,  '/auth/password').to('devise/passwords#create')  }
  end
end
