require 'pry'
class Restaurant
  attr_accessor :name, :location, :price, :name_profile, :blog, :bio, :profile_quote

  @@all = []

  def initialize(name = nil)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end


end
