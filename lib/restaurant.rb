
class Restaurant

  @@all = []

  attr_accessor :name, :url, :address
  def self.all
    @@all
  end

  def initialize(name, url, address)
    @name = name
    @url = url
    @address = address
    @@all << self
  end

end
