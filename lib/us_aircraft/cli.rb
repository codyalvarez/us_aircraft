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
  end

  def main_menu
    puts "Type 'list' to see aircraft or 'exit' to exit program."
    case user_input
    when 'list'
      puts "Sure thing, loading database."
      # sleep_counter
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
    get_more_info_for_aircraft
  end

 def get_more_info_for_aircraft
    aircraft = gets.strip.to_i
    UsAircraft::Scraper.more_info_for_aircraft(aircraft)
    chosen_aircraft = user_input
    list_aircraft(chosen_aircraft) if valid_input(chosen_aircraft, @aircraft)
    if user_input == "exit"
      exit!
    elsif
      user_input == "menu"
      main_menu
    else
      puts "Not a valid option."
    end
  end

  def about_aircraft
    aircraft = @aircraft[chosen_aircraft - 1]
    puts "AIRCRAFT INTEL FOR #{aircraft}."
    UsAircraft::Aircraft.all.each.with_index(1) do |aircraft|
    puts "#{aircraft.contractor} - #{aircraft.service} - #{aircraft.armament} - #{aircraft.power_plant} - #{aircraft.speed} - #{aircraft.range}"
    end
  end

  def valid_input(input, data)
    input.to_i <= data.length && input.to_i > 0
  end

end

# # end
