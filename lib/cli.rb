
class Cli
  BASE_URL = "https://www.tasteofhome.com/collection/best-airport-restaurants/"

  def run
    Scraper.new.list_airport
    Scraper.new.scrape_index
    puts "Welcome the Best Airports Restaurant Foodies Guide!"
    fly
  end

  def fly
    puts "\n\n Would you like to view the first or last of the list?"
    puts "(please enter: 'first' or 'last')"
    input = gets.strip.downcase

    if input == "first"
      input = 1
      the_airports(input)
    elsif input == "last"
      input = 11
      the_airports(input)
  else
    puts "\nPlease enter your preference."
  end

  puts "(Enter a number from 1 - 20)"
  input = gets.strip.to_i

  if input >= 1 && input > 20
    r_info(input)
  else
    while input < 1 || input > 20
    puts "Please enter a valid number from 1-20"
    input = gets.strip.to_i
  end
    r_info(input)
    # fly
end

  puts "Are you ready to venture off on new adventures? Y/N"
  if input == "y"
    # fly
  else
    puts "\n\n Thank you!"
    exit
  end
end

  def the_airports(place)
    if place == 1
      puts "\n\n Beginning list of Best Airport Resturants \n\n"
      Airport.all[0..10]
  #     Airport.first(10).each do |p|
  #      puts "#{p.name}. #{p.url_last}"
  # end
   else
      puts "\n\n Ending of list of Best Airport Resturants \n\n"
      Airport.all[11..20]
    #   Airport.last(10).each do |p|
    #   puts "#{p.name}. #{p.url_last}"
    #   fly
    #  end
   end
 end

 # def choose_place
 #   puts 'Choose a places to eat!'
 #   index = gets.strip.to_i - 1
 #   restaurant = Airport.all[index]
 #   Scraper.list_airport(restaurant)
 #   self.restaurant_info(restaurant)
 #   fly
 # end

  def r_info(index)
    puts "\n\n\n"
    puts "#{Airport.all[index].name}"
    puts "#{Airport.all[index].url_last}"
    puts "\n\n\n"
    fly
  end

end
# Airport.all[place - 10].each do |p|
#   p.self
  # puts "#{p.name}. #{p.url_last}. #{p.info}"
# end

# Airport.all[place - 10].each do |p|
#   p.self
  # puts "#{p.name}. #{p.url_last}. #{p.info}"
