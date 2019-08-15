
class Scraper

def self.scrape_index_page
      doc = Nokogiri::HTML('https://www.timeout.com/chicago/restaurants/the-best-sushi-in-chicago')
      restaurant_list = []
      doc.css("clearfix xs-text-left zone xs-pb4 list-redesign v5-zone has-moblie-cta").each do |restaurants|
      name_profile = restaurants.css("h4 a").attribute("href").value
      location = restaurants.css("tbody.tr(1) xs-px0 sm-full-width").text
      price = restaurants.css("tbody.tr(4) xs-px0 sm-full-width").text
      restaurant = {name: name, location: location, price: price}
      restaurant_list << restaurant
    end
    restaurant_list
  end


  def self.scrape_profile_page(name_profile)
      #doc = Nokogiri::HTML('https://www.timeout.com/chicago/restaurants/the-best-sushi-in-chicago')
      doc = Nokogiri::HTML(open(name_profile))
      restaurant_list = {}
      social_container = doc.css("tbody").collect {|info| info.text}
      social_container.each do |info|
        if  info.include?("address")
          retaurant[:location] = info
        elsif info.include?("price")
          retaurant[:price] = info
        else retaurant[:blog] = info
        end
      end
          restaurant[:bio] = doc.css("section.div. xs-pl0 xs-pt0 xs-mb5 xs-pb0 sm-pb3 sm-mb0").text
        restaurant[:profile_quote] = doc.css("section.div.article").text
          restaurant
  end
end
