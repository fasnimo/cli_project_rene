class Scraper

  def restaurant_scrape
  html = File.read('https://www.timeout.com/chicago/restaurants/the-best-sushi-in-chicago')
  cli_project = Nokogiri::HTML(html)

  projects = {}

  cli_project.css("clearfix xs-text-left zone xs-pb4 list-redesign v5-zone has-moblie-cta").each do |project|
    title = project.css("h3 a href").text
    projects[title.to_sym] = {
      # :image_link => project.css("div.project-thumbnail a img").attribute("src").value,
      # :description => project.css("p.bbcard_blurb").text,
      :location => project.css("tbody.tr(1) xs-px0 sm-full-width").text,
      :cost => project.css("tbody.tr(4) xs-px0 xm-full-width").text#.gsub("%","").to_i
    }
  end

  projects
end
#restaurant_scrape

end
