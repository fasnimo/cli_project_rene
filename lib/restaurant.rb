require 'pry'
class Restaurant
  attr_accessor :name, :page

  @@all = []

  def initialize(name=nil, page= nil)
    @name = name
    @page = page
    @@all << self
  end

  def self.all
    @@all
  end

  # def self.new_list(l)
  #   self.new(
  #
  #   l.css('h4 strong').text,
  #   l.css('h4 a').map{|lin| lin.attr('href')}[0]
  #   )
  #   #binding.pry
  # end

  # def name
  #   @name = doc.css(".entry-content .listicle-page:contains('name')").text
  # end
  #
  # def url_last
  #   @url_last = doc.css(".entry-content .listicle-page:contains('url_last')")
  # end
end
