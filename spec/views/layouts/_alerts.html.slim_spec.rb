# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'layouts/_alerts.html.slim', type: :view do
  it 'renders notices if present' do
    flash[:notice] = 'This is a notice!'
    render
    assert_select 'div.alert', count: 1
  end

  it 'renders alerts if present' do
    flash[:alert] = 'This is an alert!'
    render
    assert_select 'div.alert', count: 1
  end

  it 'renders notices and alerts if both are present' do
    flash[:notice] = 'This is a notice!'
    flash[:alert] = 'This is an alert!'
    render
    assert_select 'div.alert', count: 2
  end

  it 'renders nothing when no alerts or notices are present' do
    render
    assert_select 'div.alert', count: 0
  end
end
