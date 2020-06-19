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

	def self.more_info_for_aircraft(aircraft)
		url = "#{BASE_URL}#{aircraft.path}"
		page = Nokogiri::HTML(open(url))  
  	# attrs = page.search("div#bodyContent div.field.field--label-above")
		# # binding.pry
		# page.css(".field--label-above")[0].text.gsub(/\s+/, " ")
		# aircraft.contractor = page.css(".field--label-above")[0].text.gsub(/\s+/, " ")
		# aircraft.service = page.css(".field--label-above")[1].text.gsub(/\s+/, " ")
		# aircraft.armament = page.css(".field--label-above")[2].text.gsub(/\s+/, " ")
		# aircraft.power_plant = page.css(".field--label-above")[3].text.gsub(/\s+/, " ")
		# aircraft.speed = page.css(".field--label-above")[4].text.gsub(/\s+/, " ")
		# aircraft.range = page.css(".field--label-above")[5].text.gsub(/\s+/, " ")
  end

	def thunderbolt
    site = "https://www.military.com/equipment/a-10-thunderbolt-ii"
    page = Nokogiri::HTML(open(site))
    contractor = page.css(".field--label-above")[0].text.gsub(/\s+/, " ")
    service = page.css(".field--label-above")[1].text.gsub(/\s+/, " ")
    armament = page.css(".field--label-above")[2].text.gsub(/\s+/, " ")
    power_plant = page.css(".field--label-above")[3].text.gsub(/\s+/, " ")
    speed = page.css(".field--label-above")[4].text.gsub(/\s+/, " ")
    range = page.css(".field--label-above")[5].text.gsub(/\s+/, " ")
  end

  def raptor
    site = "https://www.military.com/equipment/f-22-raptor"
    page = Nokogiri::HTML(open(site))
    ontractor = page.css(".field--label-above")[0].text.gsub(/\s+/, " ")
    service = page.css(".field--label-above")[1].text.gsub(/\s+/, " ")
    armament = page.css(".field--label-above")[2].text.gsub(/\s+/, " ")
    power_plant = page.css(".field--label-above")[3].text.gsub(/\s+/, " ")
    speed = page.css(".field--label-above")[4].text.gsub(/\s+/, " ")
    range = page.css(".field--label-above")[5].text.gsub(/\s+/, " ")
  end

  def f_35a_lightning
    site = "https://www.military.com/equipment/f-35a-lightning-ii"
    page = Nokogiri::HTML(open(site))
    intel = page.css('')
  end

  def hornet
    site = "https://www.military.com/equipment/f-18c-d-hornet"
    page = Nokogiri::HTML(open(site))
    intel = page.css('')
  end

  def fighting_falcon
    site = "https://www.military.com/equipment/f-16-fighting-falcon"
    page = Nokogiri::HTML(open(site))
    intel = page.css('')
  end

  def growler_us_navy_aircraft
    site = "https://www.military.com/equipment/ea-18g-growler"
    page = Nokogiri::HTML(open(site))
    intel = page.css('')
  end

  def super_hornet
    site = "https://www.military.com/equipment/f-a-18e-f-super-hornet"
    page = Nokogiri::HTML(open(site))
    intel = page.css('')
  end

  def kiowa_warrior
    site = "https://www.military.com/equipment/oh-58d-kiowa-warrior"
    page = Nokogiri::HTML(open(site))
    intel = page.css('')
  end

  def stinger
    site = "https://www.military.com/equipment/oh-58d-kiowa-warrior"
    page = Nokogiri::HTML(open(site))
    intel = page.css('')
  end

  def reaper
    site = "https://www.military.com/equipment/oh-58d-kiowa-warrior"
    page = Nokogiri::HTML(open(site))
    intel = page.css('')
  end

  def predator 
    site = "https://www.military.com/equipment/mq-1b-predator"
    page = Nokogiri::HTML(open(site))
    intel = page.css('')
  end

  def f_35c_lightning
    site = "https://www.military.com/equipment/f-35c-lightning-ii"
    page = Nokogiri::HTML(open(site))
    intel = page.css('')
  end

  def f_35b_lightning
    site = "https://www.military.com/equipment/f-35b-lightning-ii"
    page = Nokogiri::HTML(open(site))
    intel = page.css('')
  end

  def strike_eagle
    site = "https://www.military.com/equipment/f-15e-strike-eagle"
    page = Nokogiri::HTML(open(site))
    intel = page.css('')
  end

  def apache_longbow
    site = "https://www.military.com/equipment/ah-64-apache-longbow"
    page = Nokogiri::HTML(open(site))
    intel = page.css('')
  end

  def super_cobra
    site = "https://www.military.com/equipment/ah-1w-super-cobra"
    page = Nokogiri::HTML(open(site))
    intel = page.css('')
  end

  def viper
    site = "https://www.military.com/equipment/ah-1z-viper"
    page = Nokogiri::HTML(open(site))
    intel = page.css('') 
  end

  def harrier
    site = "https://www.military.com/equipment/av-8b-harrier-ii"
    page = Nokogiri::HTML(open(site))
    intel = page.css('')
  end
    
end