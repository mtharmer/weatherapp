# frozen_string_literal: true

module ApplicationHelper
  def format_minute(date)
    Time.zone.at(date)&.strftime('%l:%M %p') || date
  end

  def format_hour(date)
    Time.zone.at(date)&.strftime('%A %l %p') || date
  end

  def format_day(date)
    Time.zone.at(date)&.strftime('%A %_m/%e') || date
  end

  def format_long_date(date)
    Time.zone.at(date)&.strftime('%A, %B %-d %Y') || date
  end

  def format_temp(temp)
    "#{Integer(temp)} °F"
  end

  def first_of_day(date)
    hr = Time.zone.at(date)&.hour
    p hr
    hr&.<= 2
  end
end
