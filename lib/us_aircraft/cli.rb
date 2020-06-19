require "pry"
class UsAircraft::CLI
  def call
    puts "\nTop US Attack Aircraft.\n"
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
    get_more_info_for_aircraft
  end

 def get_more_info_for_aircraft
    index = gets.strip.to_i #sintrg to an integer to_i
    aircraft = UsAircraft::Aircraft.all[index - 1] 
    puts "AIRCRAFT INTEL FOR #{aircraft.name}."
    case user_input
    when "1"
      self.thunderbolt.new
    when "2"
      self.raptor.new
    when "3"
      self.f_35a_lightning.new
    when "4"
      self.hornet.new
    when "5"
      self.fighting_falcon.new
    when "6"
      self.growler_us_navy_aircraft.new
    when "7"
      self.super_hornet.new
    when "8"
      self.kiowa_warrior.new
    when "9"
      self.stinger.new
    when "10"
      self.reaper.new
    when "11"
      self.predator.new
    when "12"
      self.f_35c_lightning.new
    when "13"
      self.f_35b_lightning.new
    when "14"
      self.strike_eagle.new
    when "15"
      self.apache_longbow.new
    when "16"
      self.super_cobra.new
    when "17"
      self.viper.new
    when "18"
      self.harrier.new   
    else
      puts "Not a valid option, no surrender ! Try again !"
    end
  end
    
  def valid_input(input, data)
    input.to_i <= data.length && input.to_i > 0
  end

end


