class CliProjectRene::Scraper

  BASE_URL = "https://www.tasteofhome.com/collection/best-airport-restaurants/"

  def self.scrape(index_url)
    doc = Nokogiri.HTML(open(index_url))
    resturant_list = []
    doc.css("div.listicle-page.tracking-fired").each do |resturants|
    name = resturants.css("a").attribute("href").value
    location = returants.css("p.stong").text
    resturant = {name: name, location: location}
    resturant_list << resturant
  end
    resturant_list
  end

  def self.scrape_name(link)
    url = resturant.url
    html = Nokogiri.HTML(open(url))
    info = html.css("a.SWhtmlLink")[2].link.map do ||
  end

end
