# frozen_string_literal: true

FactoryBot.define do
  factory :daily, class: 'WeatherApi::Daily' do
    time                                  { Faker::Number.within(range: 0..5).days.from_now.to_s }
    cloud_base_avg                        { Faker::Number.within(range: 0.0..5.0).round(2) }
    cloud_base_max                        { Faker::Number.within(range: 0.0..5.0).round(2) }
    cloud_base_min                        { Faker::Number.within(range: 0.0..5.0).round(2) }
    cloud_ceiling_avg                     { Faker::Number.within(range: 0.0..5.0).round(2) }
    cloud_ceiling_max                     { Faker::Number.within(range: 0.0..5.0).round(2) }
    cloud_ceiling_min                     { Faker::Number.within(range: 0.0..5.0).round(2) }
    cloud_cover_avg                       { Faker::Number.within(range: 0..100) }
    cloud_cover_max                       { Faker::Number.within(range: 0..100) }
    cloud_cover_min                       { Faker::Number.within(range: 0..100) }
    dew_point_avg                         { Faker::Number.within(range: 0.0..50.0).round(2) }
    dew_point_max                         { Faker::Number.within(range: 0.0..50.0).round(2) }
    dew_point_min                         { Faker::Number.within(range: 0.0..50.0).round(2) }
    evapotranspiration_avg                { Faker::Number.within(range: 0.000..1.000).round(3) }
    evapotranspiration_max                { Faker::Number.within(range: 0.000..1.000).round(3) }
    evapotranspiration_min                { Faker::Number.within(range: 0.000..1.000).round(3) }
    evapotranspiration_sum                { Faker::Number.within(range: 0.000..1.000).round(3) }
    freezing_rain_intensity_avg           { Faker::Number.within(range: 0..10) }
    freezing_rain_intensity_max           { Faker::Number.within(range: 0..10) }
    freezing_rain_intensity_min           { Faker::Number.within(range: 0..10) }
    humidity_avg                          { Faker::Number.within(range: 0.0..100).round(1) }
    humidity_max                          { Faker::Number.within(range: 0.0..100).round(1) }
    humidity_min                          { Faker::Number.within(range: 0.0..100).round(1) }
    ice_accumulation_avg                  { Faker::Number.within(range: 0..10) }
    ice_accumulation_lwe_avg              { Faker::Number.within(range: 0..10) }
    ice_accumulation_lwe_max              { Faker::Number.within(range: 0..10) }
    ice_accumulation_lwe_min              { Faker::Number.within(range: 0..10) }
    ice_accumulation_lwe_sum              { Faker::Number.within(range: 0..10) }
    ice_accumulation_max                  { Faker::Number.within(range: 0..10) }
    ice_accumulation_min                  { Faker::Number.within(range: 0..10) }
    ice_accumulation_sum                  { Faker::Number.within(range: 0..10) }
    moonrise_time                         { Faker::Number.within(range: 0..5).hours.from_now.to_s }
    moonset_time                          { Faker::Number.within(range: 0..5).hours.from_now.to_s }
    precipitation_probability_avg         { Faker::Number.within(range: 0..100) }
    precipitation_probability_max         { Faker::Number.within(range: 0..100) }
    precipitation_probability_min         { Faker::Number.within(range: 0..100) }
    pressure_surface_level_avg            { Faker::Number.within(range: 800.0..1100.0).round(2) }
    pressure_surface_level_max            { Faker::Number.within(range: 800.0..1100.0).round(2) }
    pressure_surface_level_min            { Faker::Number.within(range: 800.0..1100.0).round(2) }
    rain_accumulation_avg                 { Faker::Number.within(range: 0..10) }
    rain_accumulation_lwe_avg             { Faker::Number.within(range: 0..10) }
    rain_accumulation_lwe_max             { Faker::Number.within(range: 0..10) }
    rain_accumulation_lwe_min             { Faker::Number.within(range: 0..10) }
    rain_accumulation_max                 { Faker::Number.within(range: 0..10) }
    rain_accumulation_min                 { Faker::Number.within(range: 0..10) }
    rain_accumulation_sum                 { Faker::Number.within(range: 0..10) }
    rain_intensity_avg                    { Faker::Number.within(range: 0..10) }
    rain_intensity_max                    { Faker::Number.within(range: 0..10) }
    rain_intensity_min                    { Faker::Number.within(range: 0..10) }
    sleet_accumulation_avg                { Faker::Number.within(range: 0..10) }
    sleet_accumulation_lwe_avg            { Faker::Number.within(range: 0..10) }
    sleet_accumulation_lwe_max            { Faker::Number.within(range: 0..10) }
    sleet_accumulation_lwe_min            { Faker::Number.within(range: 0..10) }
    sleet_accumulation_lwe_sum            { Faker::Number.within(range: 0..10) }
    sleet_accumulation_max                { Faker::Number.within(range: 0..10) }
    sleet_accumulation_min                { Faker::Number.within(range: 0..10) }
    sleet_intensity_avg                   { Faker::Number.within(range: 0..10) }
    sleet_intensity_max                   { Faker::Number.within(range: 0..10) }
    sleet_intensity_min                   { Faker::Number.within(range: 0..10) }
    snow_accumulation_avg                 { Faker::Number.within(range: 0.0..10.0).round(2) }
    snow_accumulation_lwe_avg             { Faker::Number.within(range: 0.0..10.0).round(2) }
    snow_accumulation_lwe_max             { Faker::Number.within(range: 0.0..10.0).round(2) }
    snow_accumulation_lwe_min             { Faker::Number.within(range: 0.0..10.0).round(2) }
    snow_accumulation_lwe_sum             { Faker::Number.within(range: 0.0..10.0).round(2) }
    snow_accumulation_max                 { Faker::Number.within(range: 0.0..10.0).round(2) }
    snow_accumulation_min                 { Faker::Number.within(range: 0.0..10.0).round(2) }
    snow_accumulation_sum                 { Faker::Number.within(range: 0.0..10.0).round(2) }
    snow_intensity_avg                    { Faker::Number.within(range: 0..10) }
    snow_intensity_max                    { Faker::Number.within(range: 0..10) }
    snow_intensity_min                    { Faker::Number.within(range: 0..10) }
    sunrise_time                          { Faker::Number.within(range: 0..5).hours.from_now.to_s }
    sunset_time                           { Faker::Number.within(range: 0..5).hours.from_now.to_s }
    temperature_apparent_avg              { Faker::Number.within(range: -40.0..100.0).round(1) }
    temperature_apparent_max              { Faker::Number.within(range: -40.0..100.0).round(1) }
    temperature_apparent_min              { Faker::Number.within(range: -40.0..100.0).round(1) }
    temperature_avg                       { Faker::Number.within(range: -40.0..100.0).round(1) }
    temperature_max                       { Faker::Number.within(range: -40.0..100.0).round(1) }
    temperature_min                       { Faker::Number.within(range: -40.0..100.0).round(1) }
    uv_health_concern_avg                 { Faker::Number.within(range: 0..10) }
    uv_health_concern_max                 { Faker::Number.within(range: 0..10) }
    uv_health_concern_min                 { Faker::Number.within(range: 0..10) }
    uv_index_avg                          { Faker::Number.within(range: 0..10) }
    uv_index_max                          { Faker::Number.within(range: 0..10) }
    uv_index_min                          { Faker::Number.within(range: 0..10) }
    visibility_avg                        { Faker::Number.within(range: 0..10) }
    visibility_max                        { Faker::Number.within(range: 0..10) }
    visibility_min                        { Faker::Number.within(range: 0..10) }
    weather_code_max                      { Faker::Number.within(range: 0..10) }
    weather_code_min                      { Faker::Number.within(range: 0..10) }
    wind_direction_avg                    { Faker::Number.within(range: 0.0..360.0).round(1) }
    wind_gust_avg                         { Faker::Number.within(range: 0.0..70.0).round(1) }
    wind_gust_max                         { Faker::Number.within(range: 0.0..70.0).round(1) }
    wind_gust_min                         { Faker::Number.within(range: 0.0..70.0).round(1) }
    wind_speed_avg                        { Faker::Number.within(range: 0.0..70.0).round(1) }
    wind_speed_max                        { Faker::Number.within(range: 0.0..70.0).round(1) }
    wind_speed_min                        { Faker::Number.within(range: 0.0..70.0).round(1) }
  end
end
