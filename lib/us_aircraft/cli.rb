require "pry"
class UsAircraft::CLI
  def call
    puts "\nTop US Attack Aircraft.\n"
    main_menu
  end

  def user_input
    user_input = gets.strip
  end

  def sleep_counter
    sleep(1.0)
    puts "."
    sleep(1.0)
    puts ".."
    sleep(1.0)
    puts "..."
    sleep(1.0)
  end

  def main_menu
    puts "Type 'list' to see aircraft or 'exit' to exit program."

    if user_input == "list"
      puts "Sure thing, loading database."
      # sleep_counter
      list_aircraft    
    else 
      "No surrender ! Try again !"
      main_menu
    end
  end

  def list_aircraft
    puts "Lighting speeds, hundreds of succesful missions, the greatest US Attack Aircraft to date."
    UsAircraft::Scraper.scrape_aircraft
    @aircraft = UsAircraft::Aircraft.all
    @aircraft.each_with_index.map do |index, aircraft|
      "#{index}. #{aircraft}"

    puts "Choose an index of the aircraft to get more information."
    get_more_info_for_aircraft
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
