# frozen_string_literal: true

FactoryBot.define do
  factory :forecast, class: 'WeatherApi::Forecast' do
    association :minutely, strategy: :build
    association :hourly, strategy: :build
    association :daily, strategy: :build
  end
end
