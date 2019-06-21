require_relative '../config/environment'
require_relative '../bin/helper_methods'
require 'io/console'
require 'word_wrap/core_ext'


# def game_logo
#   system "artii 'Argon Trail' --font ogre | lolcat"
# end

# def continue?
#   print "Press any key to continue"
#   STDIN.getch
#   print "                                    \r" # extra space to overwrite in case next sentence is short
# end

# def week(num)
#   system "artii 'WEEK #{num}' --font standard | lolcat"
# end

# def name_ship
#   TTY::Prompt.new.ask('What is the name your ship?') do |q|
#     q.required true
#     q.convert -> (input) {
#       puts "Your ship name is #{input}"
#       User.create(name: input)
#     }
#   end
# end


# binding.pry




 # ________________________________________

# def current_user
#   User.last
# end


# def display_week_one
#   puts "Week One"
# end

# <-------------  ABTRACTED CODE  -------------------->

# def journey(week_num)
#   Journey.find_by(week_number: week_num)
# end

# def journey_outcomes(week_num)
#   journ = journey(week_num)
#   journ_outcomes = Outcome.all.select { |oc| oc.week_number == journ.week_number }
# end   # => returns an array of 2 Outcome instances

# # Shows Outcome consequence
# def consequence_text(journ_outcomes)
#   puts "#{journ_outcomes.consequence}".wrap
# end

# # Will display and shame the user with huge obnoxious art if crew_total <= 0 
# def you_lose
#   begin
#     exit
#   rescue SystemExit
#     system "artii 'YOU LOSE' --font standard | lolcat"
# end

# end

# # Executes +/- of num_of_crew
# def modify_crew(chosen_outcome)
#   ship = current_user.num_of_crew
#   modified_crew = ship + chosen_outcome.crew_modifier
#   current_user.update(num_of_crew: modified_crew)
#     if current_user.num_of_crew > 0  
#       puts " You now have #{current_user.num_of_crew} crew left."
#     else
#       you_lose
#     end
# end

# def tty_scenario_prompt(journ, journ_outcomes)
#   TTY::Prompt.new.select("#{journ.scenario}".wrap) do |menu|
#     menu.choice "#{journ_outcomes[0].choice_prompt}".wrap => -> do
#       system "clear"
#       sleep 0.5
#       consequence_text(journ_outcomes[0])
#       system "echo"
#       sleep 1.5
#       modify_crew(journ_outcomes[0])
#       system "echo"
#       continue?
#     end
#     menu.choice "#{journ_outcomes[1].choice_prompt}".wrap => -> do
#       system "clear"
#       sleep 0.5
#       consequence_text(journ_outcomes[1])
#       system "echo"
#       sleep 1.5
#       modify_crew(journ_outcomes[1])
#       system "echo"
#       continue?
#     end
#   end
# end

# def space
#   5.times do
#     system "echo"
#   end
# end

# def scenario(week_num)
#   tty_scenario_prompt(journey(week_num), journey_outcomes(week_num))
# end

# def title_screen
  # system "clear"

  # space



  # game_logo

  # system "echo"
  # continue?


  # name_ship

  # system "clear"
  # sleep 0.5
# end

title_screen

# def scenario_phase
#   space
#   week(1)
#   scenario(1)

#   space
#   week(2)
#   scenario(2)

#   space
#   week(3)
#   scenario(3)

#   space
#   week(4)
#   scenario(4)

#   space
#   week(5)
#   scenario(5)
# end

scenario_phase

# <-------------- ORIGINAL CODE -------------------------->

# # Finds our journey
# scene_one = Journey.find_by(week_number: "1")
# # Finds our outcomes associated with journey
# pull = Outcome.all.each do |oc|
#   oc.journey_id == scene_one.id
# end


# # Shows to Player scenario and choice selections
#   TTY::Prompt.new.select("#{scene_one.scenario}") do |menu|
#     menu.choice "#{pull[0].choice_prompt}" => -> do
#       consequence_text(pull[0])
#       modify_crew(pull[0])
#     end
#     menu.choice "#{pull[1].choice_prompt}" => -> do
#       consequence_text(pull[1])
#       modify_crew(pull[1])
#     end
#   end


# Random Journey method
  # def random_journey_gen
  #  rdm_journey = rand(1..Journey.all.count)
  # end



# puts "Yas"
