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

  def self.new_list(l)
    self.new(
    l.css('h4').collect{|s| s.css('strong').text.strip},
    l.css('h4 a').attribute('href')
    )

  end
  #might delete
  def doc
    @doc ||= Nokogiri::HTML(open("https://www.tasteofhome.com/collection/best-airport-restaurants/"))
  end

  def name
    @name = doc.css(".entry-content .listicle-page:contains('name')").text
  end

  def url_last
    @url_last = doc.css(".entry-content .listicle-page:contains('url_last')")
  end
end
