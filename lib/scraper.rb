require 'pry'

# doc = Nokogiri::HTML(open("https://www.timeout.com/chicago/restaurants/the-best-sushi-in-chicago"))
# nodes = doc.css(".card-title a")
# names = doc.css(".card-title a").map(&:text).map(&:strip)
# link1 = doc.css(".card-title a").attr("href").value
# links = doc.css(".card-title a").map{|a| a.attr("href")}
# link1
# detail_page = Nokogiri::HTML(open("https://www.timeout.com" + link1))
# listing_details = detail_page.css(".listing_details")
# address = listing_details.css("tr:nth-child(1) td").text.strip
# price = listing_details.css("tr:nth-child(5) td").text.strip


class Scraper
  SITE = "https://www.timeout.com/chicago/restaurants/the-best-sushi-in-chicago"

def self.scrape_page
  food = open(SITE)
  html = Nokogiri::HTML(food)
  rest = html.css(".card-title a")
  rest.each do |list|
    inputs = {
      name: list.css(".card-title a").map(&:text).map(&:strip),
      url: list.css(".card-title a").attr("href")#.value
    }
    Restaurant.new(inputs)
end
end

def self.inform(foodies)
  url = foodies.url
  htmls = Nokogiri::HTML(open("https://www.timeout.com"))
  
  details = htmls.css(".listing_details")
  foodies.address = details.css("tr:nth-child(1) td").text.strip
  foodies.price = details.css("tr:nth-child(5) td").text.strip

end
end
