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


def self.scrape_page

  html = Nokogiri::HTML(open("https://www.timeout.com/chicago/restaurants/the-best-sushi-in-chicago"))
  html.css('.card-title a').collect do |list|
    inputs = {
      name: list.css('.card-title a').map(&:text).map(&:strip),
      url: list.css('.card-title a').attr('href') #.value
    }
    Restaurant.new(inputs)

end
end

def self.inform

  htmls = Nokogiri::HTML(open('https://www.timeout.com/chicago/restaurants'))
  htmls.css('.listing_details').map do |detail|
    input = {
  address: detail.css('tr:nth-child(1) td').text.strip,
  price: detail.css('tr:nth-child(5) td').text.strip
  }
  Restaurant.new(input)

end
end
end
