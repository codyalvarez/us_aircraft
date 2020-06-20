require "pry"
class UsAircraft::CLI
  def call
    puts "Top US Attack Aircraft."
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

  def list_aircraft
    puts "Lighting speeds, hundreds of succesful missions, the greatest US Attack Aircraft to date."
    UsAircraft::Scraper.scrape_aircraft
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
    puts "AIRCRAFT INTEL FOR #{aircraft.name}."
    if index == "1" || index == "2"
      self.info_for_aircraft.new(aircraft)
      main_menu
    elsif user_input== between?(3, 18)
      self.info_for_aircraft_two.new(aircraft)
      main_menu
    else
      puts "Not a valid option, no surrender ! Try again !" 
      info_for_aircraft
    end
  end 
    
  def valid_input(input, data)
    input.to_i <= data.length && input.to_i > 0
  end

end


