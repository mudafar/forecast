def cities_locations
  Rails.cache.fetch('cities_locations') do
    [
        CityLocation.new('Santiago', -33.459229, -70.645348),
        CityLocation.new('Zurich', 47.3769, 8.5417),
        CityLocation.new('Auckland', -36.848461, 174.763336),
        CityLocation.new('Sydney', -33.865143, 151.209900),
        CityLocation.new('London', 51.509865, -0.118092),
        CityLocation.new('Georgia', 33.247875, -83.441162),
    ]
  end
end