class Scraper
  BASE_URL = "https://www.tasteofhome.com/collection/best-airport-restaurants/"

  def self.scrape_resturant
    page = open(BASE_URL)
    html = Nokogiri.HTML(page)
    resturants = doc.css(".listicle-page.track-fired")
    resturants.each do |list|
      input = {
        name: list.css(".SWhtmlLink a"),
        url_last: list.css("a")[0].attr("href")}
      Airport.new(input)
    end
  end

  def self.scraper_details(resturant)
    url = resturant.url
    html = Nokogiri.HTML(open(url))
    description =
    html.css(".SWhtmlLink li").text
  end
end
