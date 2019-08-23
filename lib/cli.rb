
class Cli

  def run
      puts ""
      puts "Welcome!"
      puts ""
      Scraper.scrape_page
      input = ""
    until input == "exit"
    if input == "list"
      self.list_restaurant
      self.determine
    end
      puts "Please enter 'list'!"
      puts " Please type 'exit' to leave. Thank you!"
      input = gets.chomp
    end
  end

  def list_restaurant
      Restaurant.all.each_with_index do |r, index|
      puts "#{index + 1}. #{r.name}"
      end
  end

  def determine
      puts ""
      puts "Please choose by number"
      index = gets.strip.to_i - 1
    if index >= 0 && index < Restaurant.all.size
      foodies = Restaurant.all[index]
      information(foodies)
    else
      puts "Invalid input!"
      determine
    end
  end

  def information(foodies)
      puts ""
      puts foodies.address
      puts ""
      puts "We hope you enjoyed our services!"
      puts ""
    end
end
