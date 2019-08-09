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
  # def self.scrape(index_url)
  #   doc = Nokogiri.HTML(open(index_url))
  #   resturant_list = doc.search("div.listicle-page.tracking-fired a")
  #   doc.css("div.listicle-page.tracking-fired").each do |resturants|
  #   name = resturants.css("a").attribute("href").value
  #   location = returants.css("p.stong").text
  #   resturant = {name: name, location: location}
  #   resturant_list << resturant
  # end
  #   resturant_list
  # end

  def self.scrape_name(lin)
    url = shop.url
    html = open(BASE_URL + url)
    doc = Nokogiri::HTML(html)
    lin.name = doc.search("a.SWhtmlLink")

  end
  # def self.scrape_name(link)
  #   url = resturant.url
  #   html = Nokogiri.HTML(open(url))
  #   info = html.css("a.SWhtmlLink")[2].link.map do ||
  # end

end
