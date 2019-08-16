require 'pry'
class Scraper

  #doc.css(".card-title a").each do |restaurants|
def self.scrape_index_page

      doc = Nokogiri::HTML(open('https://www.timeout.com/chicago/restaurants/the-best-sushi-in-chicago'))
      restaurant_list = []
      nodes = doc.css(".card-title a")
      name = doc.css(".card-title a").map(&:text).map(&:strip)
      link1 = doc.css(".card-title a").attr("href").value
      links = doc.css(".card-title a").map{|a| a.attr("href")}
      link1
      detail_page = Nokogiri::HTML(open("https://www.timeout.com" + link1))
      listing_details = detail_page.css(".listing_details")
      address = listing_details.css("tr:nth-child(1) td").text.strip
      transport = listing_details.css("tr:nth-child(3) td").text.strip
      price = listing_details.css("tr:nth-child(5) td").text.strip

      #restaurant = {name: name, link0: link0}
      #restaurant_list << restaurant
    #restaurant_list
  end

  #def self.scrape_profile_page
    # detail_page = Nokogiri::HTML(open("https://www.timeout.com" + link1))
    # listing_details = detail_page.css(".listing_details")
    # address = listing_details.css("tr:nth-child(1) td").text.strip
    # transport = listing_details.css("tr:nth-child(3) td").text.strip
    # price = listing_details.css("tr:nth-child(5) td").text.strip
    #puts "Im in scrape index page"
  #end
end
#     doc = Nokogiri::HTML(open("https://www.timeout.com" + link0))
#     restaurant_list = {}
#     social_container = doc.css(".listing_details").collect {|info| info.text}
#     social_container.each do |info|
#       if  info.include?("address")
#         retaurant[:address] = info
#       elsif  info.include?("transport")
#           retaurant[:transport] = info
#       elsif info.include?("price")
#         retaurant[:price] = info
#       else retaurant[:blog] = info
#       end
#     end
#         restaurant[:blog] = doc.css("div.reviewBody").text
#         restaurant_list
#
