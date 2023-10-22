# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  let(:bad_date) { 'bad date' }
  let!(:current_time) { DateTime.now }
  let!(:string_time) { current_time.to_s }

  describe 'format_minute' do
    it 'returns the original string if a date cannot be parsed' do
      expect(format_minute(bad_date)).to eq('bad date')
    end

    it 'formats to 12-hour EST time' do
      expect(format_minute(string_time)).to eq(current_time.strftime('%l:%M %p'))
    end
  end

  describe 'format_hour' do
    it 'returns the original string if a date cannot be parsed' do
      expect(format_hour(bad_date)).to eq('bad date')
    end

    it 'formats to 12-hour EST time' do
      expect(format_hour(string_time)).to eq(current_time.strftime('%A %l %p'))
    end
  end

  describe 'format_day' do
    it 'returns the original string if a date cannot be parsed' do
      expect(format_day(bad_date)).to eq('bad date')
    end

    it 'formats to DayOfWeek Month/Day' do
      expect(format_day(string_time)).to eq(current_time.strftime('%A %_m/%e'))
    end
  end
end
