# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'layouts/_navbar.html.slim', type: :view do
  let(:user) { create(:user) }

  it do
    render
    assert_select 'li.nav-item a', href: root_path, text: /home/i, count: 1
  end

  context 'when logged out' do
    before do
      render
    end

    it { assert_select 'li.nav-item a[href=?]', new_user_session_path, text: /sign in/i, count: 1 }
    it { assert_select 'li.nav-item form[action=?]', destroy_user_session_path, text: /sign out/i, count: 0 }
    it { assert_select 'li.nav-item a[href=?]', new_user_registration_path, text: /sign up/i, count: 1 }
  end

  context 'when logged in' do
    before do
      sign_in user
      render
    end

    it { assert_select 'li.nav-item a[href=?]', new_user_session_path, text: /sign in/i, count: 0 }
    it { assert_select 'li.nav-item form[action=?]', destroy_user_session_path, text: /sign out/i, count: 1 }
    it { assert_select 'li.nav-item a[href=?]', new_user_registration_path, text: /sign up/i, count: 0 }
  end
end
