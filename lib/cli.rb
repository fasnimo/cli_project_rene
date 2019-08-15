class CLI

    def run

        puts ""
        puts "Welcome!"
        puts ""

        input = ""
        until input == "exit"

            puts "Please enter 'list restaurants'!"
            puts " Please type 'exit' to leave. Thank you!"

        input = gets.chomp

        case input
        when "list restaurants"
                list_restaurant
                information
            end
        end
    end

    def list_restaurant
        Scraper.scrape_index_page

          Restaurant.all.each.with_index(1) do |restaurants, index|
            puts "#{index}. #{restaurants.id}"
        end
    end

    def information
        puts ""
        puts "Please choose by number"

        input = gets.chomp

        restaurant = Restaurant.all[input.to_i - 1]

        Scraper.scrape_profile_page(restaurant)
        puts ""
        puts "Some of the best restaurants like #{restaurant.name}! Have tons of amazing sushi to try, here is some information below. "
        puts ""
        puts "Search nearest you #{restaurant.address}"
        puts "What you'll be paying #{restaurant.price}"
        puts ""
        puts "Please look for #{restaurant.address} in #{restaurant.name}!"
        puts ""
    end
end






# require 'pry'
# class CLI
#
#
#
#   def run
#     Scraper.scrape_index_page
#     puts "Welcome the Best Sushi Restaurants in chicago!"
#     fly
#   end
#
#   def fly
#     puts "\n\n Would you like to view the first or last of the list?"
#     puts "(please enter: 'first' or 'last')"
#     input = gets.strip.downcase
#
#     if input == "first"
#       input = 1
#       the_restaurant(input)
#     elsif input == "last"
#       input = 11
#       the_restaurant(input)
#         binding.pry
#   else
#     puts "\nPlease enter your preference."
#   end
#
#   puts "(Enter a number from 1 - 20)"
#   input = gets.strip.to_i
#
#   if input >= 1 && input > 20
#     r_info(input)
#   else
#     while input < 1 || input > 20
#     puts "Please enter a valid number from 1-20"
#     input = gets.strip.to_i
#   end
#     r_info(input)
# end
#
#   puts "Are you ready to venture off on new adventures? Y/N"
#   if input == "y"
#     # fly
#   else
#     puts "\n\n Thank you!"
#     exit
#   end
# end
#
#   def the_restaurant(place)
#     if place == 1
#       puts "\n\n Beginning list of Best Sushi Resturants in Chicago \n\n"
#
#
#    else
#       puts "\n\n Ending of list of Best Sushi Resturants in Chicago \n\n"
#
#    end
#  end
#
#  # def choose_place
#  #   puts 'Choose a places to eat!'
#  #   index = gets.strip.to_i - 1
#  #   restaurant = Airport.all[index]
#  #   Scraper.list_airport(restaurant)
#  #   self.restaurant_info(restaurant)
#  #   fly
#  # end
#
#   def r_info(index)
#     puts "\n\n\n"
#     puts "#{Scraper.name}"
#     puts "#{Scraper.page}"
#     puts "\n\n\n"
#     fly
#   end
#
# end
#
# # Airport.all[place - 10].each do |p|
# #   p.self
#   # puts "#{p.name}. #{p.url_last}. #{p.info}"
# # end
#
# # Airport.all[place - 10].each do |p|
# #   p.self
#   # puts "#{p.name}. #{p.url_last}. #{p.info}"
