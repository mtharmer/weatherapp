module WeatherApi
  class Location
    include ActiveModel::Model

    attr_accessor(*%i[
                    name
                    lat
                    lon
                    country
                    state
                    zip
                  ])
  end
end
