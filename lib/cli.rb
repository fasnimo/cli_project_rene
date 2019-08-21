require 'pry'
class Cli

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
        # Scraper.scrape_page
          Restaurant.all.each_with_index do |r, index|
            puts "#{index + 1}. #{r.name}"
        end
    end

    def determine
      puts ""
      puts "Please choose by number"
      index = gets.strip.to_i - 1
      foodies = Restaurant.all[index]
      self.information(foodies)

    end

    def information(foodies)
    
        puts ""
        puts foodies.address

        puts ""
        puts "We hope you enjoyed our services!"
        puts ""

    end
end
