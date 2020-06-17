require_relative "./us_aircraft/version"
require_relative "./us_aircraft/cli"
require_relative "./us_aircraft/scraper"
require_relative "./us_aircraft/aircraft"

require 'nokogiri'
require 'open-uri'




module UsAircraft
  class Error < StandardError; end
  # Your code goes here...
end
