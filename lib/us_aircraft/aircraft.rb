class UsAircraft::Aircraft
  @@all = [""]
  attr_accessor :name
  
  def initialize(name)
    @name = name
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