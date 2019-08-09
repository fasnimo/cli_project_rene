class CliProjectRene::Scraper

  BASE_URL = "https://www.tasteofhome.com/collection/best-airport-restaurants/"

  def self.scraper_resturants
      doc = Nokogiri::HTML(open("https://www.tasteofhome.com/collection/best-airport-restaurants/"))
      list = doc.search("div.listicle-page.tracking-fired a")

      name_list = list.search("h4").map{|h4| h4.text.strip}
      name = name_list.uniq
      url_last = list.search("a").map{|s| s.attr("href")}
      location = returants.css("p.stong").text
      name.each.with_index do |name, index|
      resturant = Airport.new(name[index], location)
      resturant.save
    end
  end

  def self.scrape_name(resturant)
    url = shop.url
    html = open(BASE_URL + url)
    doc = Nokogiri::HTML(html)
    resturant.name = doc.search("a.SWhtmlLink")

  end

end
