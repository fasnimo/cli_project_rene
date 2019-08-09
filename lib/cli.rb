
class Cli
  BASE_URL = "https://www.tasteofhome.com/collection/best-airport-restaurants/"

  def run
    self.welcome
    list_resturants
    choose_airport
    display_links
  end

  def welcome
    puts "Welcome!\n\n"
  end

  def list_resturants
    puts "What are you in the mood for?"
    Airport.all.take(20).each_with_index {|res, index| puts "#{index +1}. #{res.name}"}
  end

  def choose_airport
    puts "Choose a location"
    index = gets.strip.to_i - 1
    resturant = Airport.all[index]
    Scraper.scrape_name(resturant)
    self.display_links(resturant)
  end

  def display_links(resturant)
    puts "\n\n\n"
    puts resturant.name
    puts resturant.location
    puts "\n\n\n"
  end
end
