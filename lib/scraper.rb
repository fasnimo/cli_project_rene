class CliProjectRene::Scraper

  def scraper
    BASE_URL = "https://www.tasteofhome.com/collection/best-airport-restaurants/"
   unparsed_page = HTTParty.get(url)
   parsed_page = Nokogiri::HTML(unparsed_page)
   rest_list = parsed_page.css("div.listicle-page.track-fired")
   rest_list.each do |rest_listing|
     rest = {
       location: rest_list.css("p:nth-child(2) strong").text
       name: rest_list.css("a.SWhtmlLink strong").text
     }
   rest_cards = parsed_page.css("div.listicle-page.track-fired")
  end
  # def self.scraper_resturants
  #     doc = Nokogiri::HTML(open("https://www.tasteofhome.com/collection/best-airport-restaurants/"))
  #     list = doc.search("div.listicle-page-container")
  #
  #     name_list = list.search("h4").map{|h4| h4.text.strip}
  #     name = name_list.uniq
  #     url_last = list.search("a").map{|search| search.attr("href")}
  #     location = returants.css("p.stong").text
  #     name.each.with_index do |name, index|
  #     resturant = Airport.new(name[index], location)
  #     resturant.save
  #   end
  # end

  def self.scrape_name(resturant)
    url = resturant.url
    html = open(BASE_URL + url)
    doc = Nokogiri::HTML(html)
    resturant.name = doc.search("a.SWhtmlLink")

  end

end
