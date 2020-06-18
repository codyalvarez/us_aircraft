class UsAircraft::Aircraft
  @@all = []
  attr_accessor :path, :name, :contractor, :service, :armament, :power_plant, :speed, :range
  
  def initialize(name, path)
    @name = name
    @path = path
    save
  end
  
  def self.all
    UsAircraft::Scraper.scrape_aircraft if @@all.empty?
    @@all
  end 
  
  def save
    @@all << self
  end
  
end