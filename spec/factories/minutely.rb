# frozen_string_literal: true

FactoryBot.define do
  factory :minutely, class: 'WeatherApi::Minutely' do
    time                        { Faker::Number.within(range: 0..60).minutes.from_now.to_s }
    cloud_base                  { Faker::Number.within(range: 0.0..5.0).round(2) }
    cloud_ceiling               { Faker::Number.within(range: 0.0..5.0).round(2) }
    cloud_cover                 { Faker::Number.within(range: 0..100) }
    dew_point                   { Faker::Number.within(range: 0.0..50.0).round(2) }
    freezing_rain_intensity     { Faker::Number.within(range: 0..10) }
    humidity                    { Faker::Number.within(range: 0.0..100).round(1) }
    precipitation_probability   { Faker::Number.within(range: 0..100) }
    pressure_surface_level      { Faker::Number.within(range: 800.0..1100.0).round(2) }
    rain_intensity              { Faker::Number.within(range: 0..10) }
    sleet_intensity             { Faker::Number.within(range: 0..10) }
    snow_intensity              { Faker::Number.within(range: 0..10) }
    temperature                 { Faker::Number.within(range: -40.0..100.0).round(1) }
    temperature_apparent        { Faker::Number.within(range: -40.0..100.0).round(1) }
    uv_health_concern           { Faker::Number.within(range: 0..10) }
    uv_index                    { Faker::Number.within(range: 0..10) }
    visibility                  { Faker::Number.within(range: 0..10) }
    weather_code                { Faker::Number.within(range: 0..10) }
    wind_direction              { Faker::Number.within(range: 0.0..360.0).round(1) }
    wind_gust                   { Faker::Number.within(range: 0.0..70.0).round(1) }
    wind_speed                  { Faker::Number.within(range: 0.0..70.0).round(1) }
  end
end
