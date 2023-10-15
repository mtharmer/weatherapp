# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'home/index.html.slim', type: :view do
  before { render }

  it 'renders the main header' do
    assert_select 'h1', text: /welcome/i, count: 1
  end
end
