class Airport
  attr_accessor :name, :url_last, :info

  @@all = []

  def initialize(name=nil, url_last= nil, info = info)
    @name = name
    @url_last = url_last
    @info = info
    @@all << self
  end

  def self.all
    @@all
  end

  def self.new_list(l)
    self.new(
    l.css('h4').collect{|s| s.css('strong').text.strip},
    l.css('h4 a').attribute('href'),
    l.css('p')[2]
    # "#{l.css('h4').collect{|d| d.css('a.SWhtmlLink').attribute('href')}}"
    )

  end


end
