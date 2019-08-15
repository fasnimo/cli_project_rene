class Scraper

  def get_scrape
    Nokogiri::HTML(open("https://www.timeout.com/chicago/restaurants/the-best-sushi-in-chicago"))
  end

  def scrape_index
    self.get_scrape.css(".clearfix xs-text-left zone xs-pb4 list-redesign v5-zone has-moblie-cta")
    self.get_scrape.css(".js-article-wrap sm-flex")
  end

  def list_restaurant
    scrape_index.each do |li|
      Restaurant.new_list(li)
    end
  end

  def self.new_list(l)
    self.new(

    l.css('h3 a').text,
    l.css('h3 a').map{|lin| lin.attr('href')}[0]
    )
    #binding.pry
  end

  def name
    @name = doc.css(".entry-content .listicle-page:contains('name')").text
  end

  def page
    @page = doc.css(".entry-content .listicle-page:contains('page')")
  end

end




#   def self.scrape_resturant
#     page = open(BASE_URL)
#     html = Nokogiri.HTML(page)
#     resturants = doc.css(".listicle-page.track-fired")
#     resturants.each do |list|
#       input = {
#         name: list.css(".SWhtmlLink a"),
#         url_last: list.css("a")[0].attr("href")}
#       Airport.new(input)
#     end
#   end
#
#   def self.scraper_details(resturant)
#     url = resturant.url
#     html = Nokogiri.HTML(open(url))
#     description =
#     html.css(".SWhtmlLink li").text
#   end
# end
