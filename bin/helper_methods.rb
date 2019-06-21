require_relative '../config/environment'

require 'io/console'
require 'word_wrap/core_ext'


def game_logo
    system "artii 'Argon Trail' --font ogre | lolcat"
end

def intro_story
  puts "The year is 2066. Technology is beyond anything humanity has ever thought it would accomplish. The earth, however, has gone to shit. Luckily 10years ago we found a new planet Argon and many have made the grueling journey to the “new earth.” 

  Now it’s your turn. You’ve just been given a ship. It’s simple - keep your crew to get to Argon. 

  Can you survive the Argon Trail?"
end 

  def continue?
    print "Press any key to continue"
    STDIN.getch
    print "                                    \r" # extra space to overwrite in case next sentence is short
  end

  def week(num)
    system "artii 'WEEK #{num}' --font standard | lolcat"
  end

  def name_ship
    TTY::Prompt.new.ask('What is the name your ship?') do |q|
      q.required true
      q.convert -> (input) {
        puts "Your ship name is #{input}"
        User.create(name: input)
      }
    end
  end

  def name_crew
    puts "You have 7 crew members. You have been assigned 4 already."
    3.times {
      TTY::Prompt.new.ask(' Who else you bringing with you?') do |q|
      q.required true
      q.convert -> (input) { Crew.create(name: input, user_id: User.last.id) }
    end
    }
    system "echo"
    continue?
    system "clear"
    new_crew = Crew.all.where("user_id IS NULL").sample(4)
    new_crew.each do |crew|
      crew.update(user_id: User.last.id)
    end
  end

  def delete_crew(outcome_crew_mod_num)
    if User.last.crew_array.count < outcome_crew_mod_num.abs
      dead_crew = User.last.crew_array
      dead_crew.each_with_index do |crew, i|
        if i < outcome_crew_mod_num.abs
          crew.destroy
        end
      end
    else
      dead_crew = User.last.crew_array
      dead_crew.each_with_index do |crew, i|
        if i < outcome_crew_mod_num.abs
          crew.destroy
        end
      end
    end
  end

#   ------------------------------------------------

  def current_user
    User.last
  end

#   --------------------------------------------------

  def journey(week_num)
    Journey.find_by(week_number: week_num)
  end

  def journey_outcomes(week_num)
    journ = journey(week_num)
    journ_outcomes = Outcome.all.select { |oc| oc.week_number == journ.week_number }
  end   # => returns an array of 2 Outcome instances

  # Shows Outcome consequence
  def consequence_text(journ_outcomes)
    puts "#{journ_outcomes.consequence}".wrap
  end

  # Will display and shame the user with huge obnoxious art if crew_total <= 0
  def you_lose
      system "artii 'YOU LOSE' --font standard | lolcat"
      continue?
      system "ruby bin/run.rb"
  end

  # Will display when the user wins the game huge beautiful art when the crew is still intact.
  def you_win
    system "artii 'YOU WIN' --font standard | lolcat"
    continue?
    system "ruby bin/run.rb"
  end

  # Executes +/- of num_of_crew
  def modify_crew(chosen_outcome)
    ship = current_user.num_of_crew
    modified_crew = ship + chosen_outcome.crew_modifier
    current_user.update(num_of_crew: modified_crew)
      if current_user.num_of_crew > 0  && current_user.num_of_crew < 10
        puts " You now have #{current_user.num_of_crew} crew left."
      elsif current_user.num_of_crew > 1500
        puts "You have #{current_user.num_of_crew} crew members, wow that's a lot of new friends!"
        system "echo"
        you_win
      elsif current_user.num_of_crew < 1
        you_lose
      end
    delete_crew(chosen_outcome.crew_modifier)
  end

  def tty_scenario_prompt(journ, journ_outcomes)
    TTY::Prompt.new.select("#{journ.scenario}".wrap) do |menu|
      menu.choice "#{journ_outcomes[0].choice_prompt}".wrap => -> do
        system "clear"
        sleep 0.5
        space
        space
        system "echo"
        system "echo"
        consequence_text(journ_outcomes[0])
        system "echo"
        sleep 1.5
        modify_crew(journ_outcomes[0])
        system "echo"
        continue?
        system "clear"
      end
      menu.choice "#{journ_outcomes[1].choice_prompt}".wrap => -> do
        system "clear"
        sleep 0.5
        space
        space
        system "echo"
        system "echo"
        consequence_text(journ_outcomes[1])
        system "echo"
        sleep 1.5
        modify_crew(journ_outcomes[1])
        system "echo"
        continue?
        system "clear"
      end
    end
  end

  def space
    5.times do
      system "echo"
    end
  end

  def scenario(week_num)
    tty_scenario_prompt(journey(week_num), journey_outcomes(week_num))
  end


def title_screen
  system "clear"
  space



  game_logo

  system "echo"
  continue?
  
  puts "The year is 2066. Technology is beyond anything humanity has ever thought it would accomplish. The earth, however, has gone to shit. Luckily 10years ago we found a new planet Argon and many have made the grueling journey to the “new earth.” 

Now it’s your turn. You’ve just been given a ship. It’s simple - keep your crew to get to Argon. 

Can you survive the Argon Trail?".wrap
  system "echo" 
  continue?
  system "clear"
  space
  system "echo"
  system "echo"
  name_ship
  system "clear"
  sleep 0.5
  space
  system "echo"
  system "echo"
  name_crew
end




  def scenario_phase
    space
    week(1)
    scenario(1)

    space
    week(2)
    scenario(2)

    space
    week(3)
    scenario(3)

    space
    week(4)
    scenario(4)


    space
    week(5)
    scenario(5)
  end
