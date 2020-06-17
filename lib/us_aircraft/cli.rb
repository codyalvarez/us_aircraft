require "pry"
class UsAircraft::CLI
  def call
    puts "\nTop US Attack Aircraft.\n"
    menu
    list
    get_more_info_for_aircraft
  end

  def menu
    puts "Type 'list' to see aircraft or 'exit' to exit program."
    user_input = gets.strip
    
    unless user_input == "exit"
      menu  
      if user_input == "list"
        list
      elsif user_input == "exit"
        "goodbye"
      else
        "not a valid option, choose another."
      end
    end
    
  end

  def list
    puts '~ Choose an index of the aircraft to get more information. ~'
    UsAircraft::Scraper.scrape_aircraft
    @aircraft = UsAircraft::Aircraft.all
    @aircraft.each_with_index.map do |index, aircraft|  
      "#{index}. #{aircraft}"
    end
    
  end

  def get_more_info_for_aircraft
    chosen_aircraft = gets.strip.to_i
    list_aircraft(chosen_aircraft) if valid_input(chosen_aircraft, @aircraft)
  end

  def valid_input(input, data)
    input.to_i <= data.length && input.to_i > 0
  end

  def about_aircraft
    aircraft = @aircraft[chosen_aircraft - 1]
    puts "AIRCRAFT INTEL FOR #{aircraft}."
   
    Flight::Aircraft.all.each.with_index(1) do |aircraft|
      puts "#{aircraft.contractor} - #{aircraft.service} - #{aircraft.armament} - #{aircraft.power_plant} - #{aircraft.speed} - #{aircraft.range}"
    
    end

  end


end
