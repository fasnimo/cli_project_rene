require 'pry'
class Restaurant

  @@all = []

  attr_accessor :name, :url, :address, :price

  def self.all
    @@all
  end

  def initialize(name: name, url: url)
    @name = name
    @url = url
    @address, @price = nil, nil
    self.class.all << self
  end

end
