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
    index = gets.strip.to_i #sintrg to an integer to_i
    aircraft = UsAircraft::Aircraft.all[index - 1]
    # UsAircraft::Scraper.more_info_for_aircraft(aircraft)  
    puts "AIRCRAFT INTEL FOR #{aircraft.name}."
    # UsAircraft::Aircraft.all.each.with_index(1) do |aircraft|
    # puts "#{aircraft.contractor}
    # #{aircraft.service} 
    # #{aircraft.armament} 
    # #{aircraft.power_plant} 
    # #{aircraft.speed} 
    # #{aircraft.range}"
    # end
    # main_menu
    case user_input
    when "1"
      thunderbolt
    when "2"
      raptor
    when "3"
      f_35a_lightning
    when "4"
      hornet
    when "5"
      fighting_falcon
    when "6"
      growler_us_navy_aircraft
    when "7"
      super_hornet
    when "8"
      kiowa_warrior
    when "9"
      stinger
    when "10"
      reaper
    when "11"
      predator
    when "12"
      f_35c_lightning
    when "13"
      f_35b_lightning
    when "14"
      strike_eagle
    when "15"
      apache_longbow
    when "16"
      super_cobra
    when "17"
      viper
    when "18"
      harrier   
    else
      puts "Not a valid option, no surrender ! Try again !"
    end
  end

  def valid_input(input, data)
    input.to_i <= data.length && input.to_i > 0
  end

end


