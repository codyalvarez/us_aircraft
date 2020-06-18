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

	def self.more_info_for_aircraft(aircraft)
		url = "#{BASE_URL}#{aircraft.path}"
		page = Nokogiri::HTML(open(url))  

		attrs = page.search("div#bodyContent div.field.field--label-above")
		# binding.pry
		page.css(".field--label-above")[0].text.gsub(/\s+/, " ")
		aircraft.contractor = page.css(".field--label-above")[0].text.gsub(/\s+/, " ")
		aircraft.service = page.css(".field--label-above")[1].text.gsub(/\s+/, " ")
		aircraft.armament = page.css(".field--label-above")[2].text.gsub(/\s+/, " ")
		aircraft.power_plant = page.css(".field--label-above")[3].text.gsub(/\s+/, " ")
		aircraft.speed = page.css(".field--label-above")[4].text.gsub(/\s+/, " ")
		aircraft.range = page.css(".field--label-above")[5].text.gsub(/\s+/, " ")
    end

    def self.thunderbolt
      url = "https://www.military.com/equipment/a-10-thunderbolt-ii"
      page = Nokogiri::HTML(open(url))

      attrs = page.search("div#bodyContent div.field.field--label-above")
      
      page.css(".field--label-above")[0].text.gsub(/\s+/, " ")
      aircraft.contractor = page.css(".field--label-above")[0].text.gsub(/\s+/, " ")
  		aircraft.service = page.css(".field--label-above")[1].text.gsub(/\s+/, " ")
  		aircraft.armament = page.css(".field--label-above")[2].text.gsub(/\s+/, " ")
  		aircraft.power_plant = page.css(".field--label-above")[3].text.gsub(/\s+/, " ")
  		aircraft.speed = page.css(".field--label-above")[4].text.gsub(/\s+/, " ")
      aircraft.range = page.css(".field--label-above")[5].text.gsub(/\s+/, " ")
    end



    end

    # def thunderbolt
    #   page.css(".field--label-above")[0].text.gsub(/\s+/, " ")

    # end

end