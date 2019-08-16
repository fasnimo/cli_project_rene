
class CLI

    def run

        puts ""
        puts "Welcome!"
        puts ""

        input = ""
        until input == "exit"

            puts "Please enter 'list'!"
            puts " Please type 'exit' to leave. Thank you!"

        input = gets.chomp

        case input
        when "list"
                list_restaurant
                information
            end
        end
    end

    def list_restaurant
      puts "list restauran tis running"
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
        #Scraper.scraper_index_page
        Scraper.scrape_profile_page(restaurant)
        puts ""
        puts "The restaurants address is #{restaurant.address} "
        puts ""
        puts "The best way to get this is buy #{restaurant.transport}"
        puts "What you'll be paying for their best food #{restaurant.price}"
        puts ""
        puts "We hope you enjoyed out blog!"
        puts ""

    end
end
