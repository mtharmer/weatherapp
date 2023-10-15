# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Devise::RegistrationsController, type: :routing do
  describe 'routing' do
    it { is_expected.to route(:get,     '/auth/cancel').to('devise/registrations#cancel') }
    it { is_expected.to route(:get,     '/auth/sign_up').to('devise/registrations#new') }
    it { is_expected.to route(:get,     '/auth/edit').to('devise/registrations#edit') }
    it { is_expected.to route(:patch,   '/auth').to('devise/registrations#update')  }
    it { is_expected.to route(:put,     '/auth').to('devise/registrations#update')  }
    it { is_expected.to route(:delete,  '/auth').to('devise/registrations#destroy') }
    it { is_expected.to route(:post,    '/auth').to('devise/registrations#create')  }
  end
end
