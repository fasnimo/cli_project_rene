
class Scraper


def self.scrape_page
    html = Nokogiri::HTML(open("https://www.timeout.com/chicago/restaurants/the-best-sushi-in-chicago"))

    html.css('.card-title a').collect do |list|
      url = list.attr('href')
      htmls = Nokogiri::HTML(open("https://www.timeout.com#{url}"))
      name = htmls.css('h1.xs-text-2.v4-md-text-1.xs-line-height-2.v4-md-line-height-1.xs-mt4').children.first.text
      address = htmls.css('td.xs-px0.sm-full-width').children.first.text.strip


    Restaurant.new(name, url, address)


  end
end

end
