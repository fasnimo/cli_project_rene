require 'pry'
class Restaurant
  attr_accessor :name_profile, :location, :price, :blog, :bio, :profile_quote

  @@all = []

  def initialize(name_profile=nil, page= nil)
    @name_profile = name_profile
    @page = page
    @@all << self
  end

  def self.all
    @@all
  end

  
end
