
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
        puts "Please look for #{restaurant.address} in #{restaurant.name_profile}!"
        puts ""
    end
end
