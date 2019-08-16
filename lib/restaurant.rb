require 'pry'
class Restaurant
  attr_accessor :name,:link1, :links, :detail_page, :listing_details, :address, :transport, :price

  @@all = []

  def initialize(name = nil, name_profile = nil)
    @name = name
    @name_profile = name_profile
    @@all << self
  end

  def self.all
    @@all
  end


end
