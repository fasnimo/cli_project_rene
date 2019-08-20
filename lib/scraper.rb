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
      url = list.attr('href')
      htmls = Nokogiri::HTML(open("https://www.timeout.com#{url}"))
      # data = self.inform(url)
      #binding.pry
      name = htmls.css('h1.xs-text-2.v4-md-text-1.xs-line-height-2.v4-md-line-height-1.xs-mt4').children.first.text
      address = htmls.css('td.xs-px0.sm-full-width').children.first.text.strip






      #address = data[:address]
      #price = data[:price]

    Restaurant.new(name, url, address)


  end
end

# def self.inform(url)
#   # binding.pry
#   htmls = Nokogiri::HTML(open("https://www.timeout.com#{url}"))
#   binding.pry
#   html = Nokogiri::HTML(open(url))
#     docs = htmls.css('td.xs-px0.sm-full-width').children.first.text.strip.map do |detail|
#
#         input = {
#             address: detail.css('tr:nth-child(1) td').text.strip,
#             price: detail.css('tr:nth-child(5) td').text.strip
#           }
#       input
  # htmls = Nokogiri::HTML(open('https://www.timeout.com/chicago/restaurants'))
  #
  # doc = htmls.css('.listing_details').map do |detail|
  #   binding.pry
  #   input = {
  #     address: detail.css('tr:nth-child(1) td').text.strip,
  #     price: detail.css('tr:nth-child(5) td').text.strip
  # }
  #   input
  #
  #   end
  #   doc
      # end
      # binding.pry

  #end
end
