require 'pry'
class Cli

    #MAY need to change initialize


    def run

        puts ""
        puts "Welcome!"
        puts ""
        Scraper.scrape_page
        input = ""
        until input == "exit"

            puts "Please enter 'list'!"
            puts " Please type 'exit' to leave. Thank you!"

        input = gets.chomp

        case input
        when "list"
                self.list_restaurant
                self.determine
            end
        end
    end

    def list_restaurant
        #Scraper.scrape_page

          Restaurant.all.each.with_index(1) do |r, index|
            puts "#{index + 1}. #{r.name}"
        end
    end

    def determine
      puts ""
      puts "Please choose by number"
      index = gets.strip.to_i - 1
      foodies = Restaurant.all[index]
      Scraper.inform(foodies)
      self.information(foodies)
      # input = gets.chomp
      #
      # restaurants = Restaurant.all[input.to_i - 1]
      # Scraper.inform
    end

    def information(foodies)

         #Scraper.scrape_profile_page(restaurant)
        puts ""
        puts foodies.name
        puts ""
        puts foodies.address
        puts ""
        puts foodies.price
        puts ""
        puts "We hope you enjoyed our services!"
        puts ""

    end
end
