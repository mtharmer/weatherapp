# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'forecast/_search.html.slim', type: :view do
  before { render }

  it 'renders a search form' do
    assert_select 'form[action=?]', forecast_search_path, count: 1
  end

  it 'renders a search field box' do
    assert_select 'input[type=?]', 'search', count: 1
  end

  it 'renders an action button' do
    assert_select 'input[type="submit"]', count: 1
  end
end
