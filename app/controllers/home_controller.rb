class HomeController < ApplicationController
  @@country_code= "AUS"
  @@name="Melbourne"

  def index
    @cities = City.all
  end

  def <=>(zone)
    return unless zone.respond_to? :utc_offset
    result = (utc_offset <=> zone.utc_offset)
    result = (name <=> zone.name) if result == 0
    result
  end

  def country_zones(country_code)
    code = country_code.to_s.upcase
    @country_zones[code] ||= load_country_zones(code)
  end

  def local(*args)
    time = Time.utc(*args)
    ActiveSupport::TimeWithZone.new(nil, self, time)
  end

  def parse(str, now = now())
    parts_to_time(Date._parse(str, false), now)
  end

  def at(*args)
    Time.at(*args).utc.in_time_zone(self)
  end

  def now
    time_now.utc.in_time_zone(self)
  end

  def find_tzinfo(name)
    TZInfo::Timezone.new(MAPPING[name] || name)
  end

end
