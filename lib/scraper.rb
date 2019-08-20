require 'pry'
class Scraper

@@all = []

def initialize
  @@all << self
end
def self.all
  @@all
end


def self.scrape_index_page

      @doc = Nokogiri::HTML(open("https://www.timeout.com/chicago/restaurants/the-best-sushi-in-chicago"))
      @nodes = @doc.css(".card-title a")
      names = @doc.css(".card-title a").map(&:text).map(&:strip)
      link1 = @doc.css(".card-title a").attr("href").value
      links = @doc.css(".card-title a").map{|a| a.attr("href")}
      #@nodes
      #@@all << @nodes
      #link1 or nodes

end

def self.inform

      #@detail_page = Nokogiri::HTML(open("https://www.timeout.com/chicago/restaurants/the-best-sushi-in-chicago")) #+ link1

      # @detail_page.css(".listing_details").each do |listing_detail|
      #listing_details = detail_page.css(".listing_details")
      @nodes.css(".listing_details").each do |listing_detail|
      address = listing_detail.css("tr:nth-child(1) td").text.strip
      transport = listing_detail.css("tr:nth-child(3) td").text.strip
      price = listing_detail.css("tr:nth-child(5) td").text.strip
      listing_detail = self.new(address, transport, price)
      #linkall = {nodes: nodes, name: name, link1: link1, links: links}
      @@all << listing_detail

  end
end
#B
def self.create(together)
    inform(together).tap{|s| s.save}
  end
end
#Older Edits

#end
  #end

  #def self.scrape_profile_page
    # detail_page = Nokogiri::HTML(open("https://www.timeout.com" + link1))
    # listing_details = detail_page.css(".listing_details")
    # address = listing_details.css("tr:nth-child(1) td").text.strip
    # transport = listing_details.css("tr:nth-child(3) td").text.strip
    # price = listing_details.css("tr:nth-child(5) td").text.strip
    #puts "Im in scrape index page"
  #end
