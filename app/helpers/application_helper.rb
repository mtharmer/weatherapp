# frozen_string_literal: true

module ApplicationHelper
  def format_minute(date)
    Time.zone.parse(date)&.strftime('%l:%M %p') || date
  end

  def format_hour(date)
    Time.zone.parse(date)&.strftime('%A %l %p') || date
  end

  def format_day(date)
    Time.zone.parse(date)&.strftime('%A %_m/%e') || date
  end
end
