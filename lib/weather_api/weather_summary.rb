# frozen_string_literal: true

module WeatherApi
  class WeatherSummary
    include ActiveModel::Model

    attr_accessor(*%i[
                    id
                    main
                    description
                    icon
                  ])
  end
end
