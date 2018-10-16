class CityWeather < City
  require 'tzinfo'


  attr_accessor :temperature

  def initialize(name, temperature, time, timezone)
    super(name)

    @temperature = temperature
    @time = time
    @timezone = timezone
  end

  def local_time
    tzinfo = TZInfo::Timezone.get(@timezone)
    Time.at(@time).getlocal(tzinfo.current_period.offset.utc_total_offset).strftime("%H:%M")
  end


end