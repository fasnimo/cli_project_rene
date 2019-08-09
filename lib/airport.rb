class CliProjectRene::AirportResturants
  attr_accessor :name, :location, :url

  @@all = []

  def initialize(name=nil, location=nil, url = nil)
    @name = name
    @location = location
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end


end
