class Airport
  attr_accessor :name, :url_last

  @@all = []

  def initialize(name=nil, url_last= nil)
    @name = name
    @url_last = url_last
    @@all << self
  end

  def self.all
    @@all
  end


end
