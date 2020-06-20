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
    intel = page.css("div#bodyContent p").text.strip.gsub(/\s+/, " ")
    intel
  end
end

