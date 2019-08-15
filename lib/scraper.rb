require 'pry'
class Scraper

def self.scrape_index_page
      doc = Nokogiri::HTML('https://www.timeout.com/chicago/restaurants/the-best-sushi-in-chicago')
      restaurant_list = []
      doc.css("clearfix xs-text-left zone xs-pb4 list-redesign v5-zone has-moblie-cta").each do |restaurants|
          binding.pry
      name = restaurants.css("div.h3 a").text
      name_profile = restaurants.css('a').attribute('href').value
      restaurant = {name: name, name_profile: name_profile}
      restaurant_list << restaurant


    end
    restaurant_list
  end


  def self.scrape_profile_page(restaurant)
      #doc = Nokogiri::HTML('https://www.timeout.com/chicago/restaurants/the-best-sushi-in-chicago')
      url = restaurant.name_profile
      doc = Nokogiri::HTML(open(url))
      restaurant_list = {}
      social_container = doc.css("div.tbody").collect {|info| info.text}
      social_container.each do |info|
        if  info.include?("address")
          retaurant[:address] = info
        elsif  info.include?("transport")
            retaurant[:transport] = info
        elsif info.include?("price")
          retaurant[:price] = info
        else retaurant[:blog] = info
        end
      end
          restaurant[:blog] = doc.css("div.reviewBody").text
          restaurant_list
  end
end
