require 'pry'
class Restaurant

attr_accessor :name, :address

  @@all = []

  def initialize(name = nil, address = nil)
    @name = name
    @address = address
    @@all << self
  end

  def self.all
    @@all
  end
#A
  def scrape(name)
    name.each do |every|
      Scraper.create(every)
    end
  end

end
