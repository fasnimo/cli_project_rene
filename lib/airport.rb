class CliProjectRene::AirportResturants
  attr_accessor :name, :location

  @@all = []

  def initialize(name=nil, location=nil)
    @name = name
    @location = location
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-2]
  end


end
