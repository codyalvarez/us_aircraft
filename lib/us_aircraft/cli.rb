require "pry"
class UsAircraft::CLI
  def call
    puts "Top US Attack Aircraft."
    scrape_list
    main_menu
  end

  def user_input
    user_input = gets.strip
  end

  def main_menu
    puts "Type 'list' to see aircraft or 'exit' to exit program."
    case user_input
    when 'list'
      puts "Sure thing, loading database."
      list_aircraft
    when 'exit', 'quit'
      goodbye
    else
      puts "Not a valid option. No surrender ! Try again !"
      main_menu
    end
  end

  def goodbye
    puts "Goodbye! Have a nice day!"
  end

  def scrape_list
    UsAircraft::Scraper.scrape_aircraft
  end

  def list_aircraft
    puts "Lighting speeds, countless succesful missions to date, the greatest US Attack Aircraft to date:"
    @aircraft = UsAircraft::Aircraft.all
    @aircraft.each.with_index(1) do |aircraft, index|
      puts "#{index}. #{aircraft.name}"
    end
    aircraft_intel
  end

 def aircraft_intel
  puts "Choose an aircraft by index for more information."
  index = gets.strip.to_i #sintrg to an integer to_i
  aircraft = UsAircraft::Aircraft.all[index - 1]
  case index
    when 1..2
      puts "AIRCRAFT INTEL FOR #{aircraft.name}."
      puts UsAircraft::Scraper.info_for_aircraft(aircraft)
      main_menu
    when 3..18
      puts "AIRCRAFT INTEL FOR #{aircraft.name}."
      puts UsAircraft::Scraper.info_for_aircraft_two(aircraft)
      main_menu
    else
      puts "Not a valid option. No compromise ! No surrender ! Try again !"
      main_menu
    end
  end
       
  def valid_input(input, data)
    input.to_i <= data.length && input.to_i > 0
  end

end


