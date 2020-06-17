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
				p c.search('a.text--title').text.strip
			end
		end
	end

	def self.more_info_for_aircraft(aircraft)
		url = "#{BASE_URL}#{aircraft.path}"
		page = Nokogiri::HTML(open(url))  

		attrs = page.search("div#bodyContent div.field.field--label-above")
		aircraft.contractor = self.get_contractor(attrs)
		aircraft.service = self.get_service(attrs)
		aircraft.armament  = self.get_armament(attrs)
		aircraft.power_plant = self.get_power_plant(attrs)
		aircraft.speed = self.get_speed(attrs)
		aircraft.range = self.get_range(attrs)
    end
    
    def self.contractor(data)
		contractor = data[0].text.strip
	end

	def self.service(data)
		service = data[1].text.strip
	end

	def self.armament(data)
		armament = data[2].text.strip
	end

	def self.get_power_plant(data)
		power_plant = data[3].text.strip
	end

	def self.get_speed(data)
		speed = data[4].text.strip
	end

	def self.get_range(data)
		range = data[5].text.strip
	end

end