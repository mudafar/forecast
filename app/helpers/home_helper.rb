module HomeHelper
  class APIError < StandardError
    def message
      'How unfortunate! The API Request Failed'
    end
  end


  def cities_forecast
    begin
      # simulate api failure rate to ~10%
      raise APIError if rand < 0.1

      Rails.cache.fetch(__method__, expires_in: 10.seconds) do
        cities_locations.collect do |city|
          res = ForecastIO.forecast(city.latitude, city.longitude, params: {units: 'si'})
          CityWeather.new(city.name, res.currently.apparentTemperature, res.currently.time, res.timezone)
        end
      end

    rescue APIError => e
      Rails.cache.redis.hset('api.errors', Time.now.to_i, e.message)
      self.cities_forecast
    end
  end


end
