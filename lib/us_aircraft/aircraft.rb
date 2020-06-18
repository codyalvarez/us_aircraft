class UsAircraft::Aircraft
  @@all = []
  attr_accessor :name, :contractor, :service, :armament, :power_plant, :speed, :range
  
  def initialize(name)
    @name = name
    # @contractor = contractor
    # @service = service
    # @armament = armament
    # @power_plant = power_plant
    # @speed = speed
    # @range = range
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