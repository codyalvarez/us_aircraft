require "pry"
class UsAircraft::Scraper
  BASE_URL = "https://www.military.com"
	
	def self.scrape_aircraft
		site = "#{BASE_URL}/equipment/attack-aircraft"	
		page = Nokogiri::HTML(open(site))		
		grid = page.css('div.list-view')
		rows = grid.search('div.row')
		rows.each do |row|
			columns = row.search('div.col-sm-4')
			columns.each do |c|
				name = c.search('a.text--title').text.strip
				path = c.search('a.text--title').attribute("href").value
				UsAircraft::Aircraft.new(name, path)  # instantiate aircraft with the path 		
			end
		end
	end

  def self.info_for_aircraft(aircraft)
		url = "#{BASE_URL}#{aircraft.path}"
		page = Nokogiri::HTML(open(url))  
    attrs = page.css("div#bodyContent div.field.field--label-above").text.gsub(/\s+/, " ")
    attrs
  end

  def self.info_for_aircraft_two(aircraft)
    url = "#{BASE_URL}#{aircraft.path}"
    page = Nokogiri::HTML(open(url))
	var1 = page.css("div#bodyContent p")[0].text.strip.gsub(/\s+/, " ")
	var2 = page.css("div#bodyContent p")[1].text.strip.gsub(/\s+/, " ")
	var3 = var2 = page.css("div#bodyContent p")[2].text.strip.gsub(/\s+/, " ")		
    intel = [var1, var2, var3].join('')
  end
end



