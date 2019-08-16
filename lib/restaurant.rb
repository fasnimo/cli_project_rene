require 'pry'
class Restaurant
  attr_accessor :name,:link1, :links, :detail_page, :listing_details, :address, :transport, :price

  @@all = []

  def initialize(name = nil, address = nil, transport = nil, price = nil)
    @name = name
    @address = addess
    @transport = transport
    @price = price
    @@all << self
  end

  def self.all
    @@all
  end


end
