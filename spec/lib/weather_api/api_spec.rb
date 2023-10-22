# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WeatherApi::Api do
  let(:base_uri) { ENV['WEATHER_API_URL'] || 'https://api.tomorrow.io/v4/weather/' }
  let(:api_key) { ENV['WEATHER_API_KEY'] || 'somekey' }

  describe 'method definitions' do
    it { expect(described_class.methods).to include(:get_forecast) }
  end

  describe 'private method definitions' do
    it { expect(described_class.private_methods).to include(:get_request) }
    it { expect(described_class.private_methods).to include(:flatten_response_values) }
    it { expect(described_class.private_methods).to include(:translate_to_class) }
    it { expect(described_class.private_methods).to include(:format_forecast_data) }
  end

  describe 'get_forecast' do
    context 'normal process' do
      before do
        allow(described_class).to receive_messages(get_request: 'somedata', format_forecast_data: 'success!')
      end

      it 'passes response data through' do
        allow(described_class).to receive(:get_request)
        described_class.get_forecast('somelocation')
        expect(described_class).to have_received(:get_request)
      end

      it 'sends response to format_forecast_data' do
        allow(described_class).to receive(:format_forecast_data).with('somedata')
        described_class.get_forecast('somelocation')
        expect(described_class).to have_received(:format_forecast_data).with('somedata')
      end

      it 'returns the response from format_forecast_data' do
        expect(described_class.get_forecast('somelocation')).to eq('success!')
      end
    end

    context 'request validation' do
      let!(:response_body) { File.open('./spec/fixtures/forecast_response_body.json') }
      let(:headers) do
        {
          'Accept' => 'application/json',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Host' => 'api.tomorrow.io',
          'User-Agent' => 'Ruby'
        }
      end
      let(:request_uri) { "#{base_uri}forecast?apikey=#{api_key}&location=some%20location&units=imperial" }

      it 'proceeds when the request is successful' do
        stub_request(:get, request_uri).with(headers: headers).to_return(status: 200, body: response_body, headers: {})
        expect(described_class.get_forecast('some location')).not_to be_nil
      end

      it 'raises an error if the request is unsuccessful' do
        stub_request(:get, request_uri).with(headers: headers).to_return(status: 400, body: response_body, headers: {})
        expect { described_class.get_forecast('some location') }.to raise_error(
          StandardError, 'Something went wrong - the server responded with 400'
        )
      end
    end

    context 'data validation' do
      it 'requires a location to be provided' do
        expect { described_class.get_forecast }.to raise_error(
          ArgumentError,
          'Location is required'
        )
      end

      it 'requires location not be blank' do
        expect { described_class.get_forecast('') }.to raise_error(
          ArgumentError,
          'Location is required'
        )
      end

      it 'returns a forecast class' do
        allow(described_class).to receive(:get_request).and_return('somedata')
        response = described_class.get_forecast('some location')
        expect(response.class).to eq(WeatherApi::Forecast)
      end

      it 'returns an empty forecast object if data is not formatted as expected' do
        data = { somekey: 'someval' }.to_h
        allow(described_class).to receive(:get_request) { data }
        response = described_class.get_forecast('some location')
        expect(response.minutely).to be_empty
      end

      it 'fills the forecast object with relevant data' do
        data = {
          timelines: {
            minutely: [{
              time: 'sometime',
              values: { cloud_base: 1.0 }
            }]
          }
        }
        allow(described_class).to receive(:get_request) { JSON.parse(data.to_json) }
        response = described_class.get_forecast('some location')
        expect(response.minutely).not_to be_empty
        expect(response.minutely.first.cloud_base).to eq(1.0)
      end
    end
  end
end
