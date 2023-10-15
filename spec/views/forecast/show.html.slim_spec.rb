# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'forecast/show.html.slim', type: :view do
  it 'renders the search partial' do
    render
    assert_select 'div.input-group', count: 1
  end

  it 'renders the page if the forecast is present' do
    assign(:forecast, build(:forecast))
    render
    assert_select 'h1', text: /forecast/i, count: 1
    assert_select 'p', text: /select a location above to find a forecast/i, count: 0
  end

  it 'renders a message if the forecast is not present' do
    assign(:forecast, nil)
    render
    assert_select 'h1', text: /forecast/i, count: 0
    assert_select 'p', text: /select a location above to find a forecast/i, count: 1
  end
end
