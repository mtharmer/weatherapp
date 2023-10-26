# frozen_string_literal: true

module MapHelper
  def map_types
    [
      { id: 'clouds_new', label: 'Clouds' },
      { id: 'precipitation_new', label: 'Precipitation' },
      { id: 'pressure_new', label: 'Atmospheric Pressure' },
      { id: 'wind_new', label: 'Wind' },
      { id: 'temp_new', label: 'Temperature' }
      # { id: 'PAC0', label: 'Convective Precipitation' },
      # { id: 'PR0', label: 'Precipitation Intensity' },
      # { id: 'PA0', label: 'Accumulated Precipitation' },
      # { id: 'PAR0', label: 'Rain Accumulated' },
      # { id: 'PAS0', label: 'Snow Accumulation' },
      # { id: 'SD0', label: 'Snow Depth' },
      # { id: 'WS10', label: 'Wind Speed' },
      # { id: 'WND', label: 'Wind Speed and Direction' },
      # { id: 'APM', label: 'Atmospheric Pressure' },
      # { id: 'TA2', label: 'Air Temperature' },
      # { id: 'TD2', label: 'Dew Point' },
      # { id: 'TS0', label: 'Soil Surface Temperature' },
      # { id: 'TS10', label: 'Soil Temperature >10cm' },
      # { id: 'HRD0', label: 'Relative Humidity' },
      # { id: 'CL', label: 'Cloudiness' }
    ]
  end
end
