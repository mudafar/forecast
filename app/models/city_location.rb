class CityLocation < City
  attr_accessor :latitude, :longitude

  def initialize(name, latitude, longitude)
    super(name)

    @latitude = latitude
    @longitude = longitude
  end

end