require 'date'
class Interface

    attr_accessor :prompt

    def initialize
        @prompt = TTY::Prompt.new
        @player = ""
    end
    def run
        self.start
        self.main_menu
        self.sign_up
        self.player_menu
    end

    def sign_up
        username = prompt.ask("Welcome, fresh meat! What's your name?")
        @player = Player.create({name: username, heart: 5})
    end
   

    def start 
        prompt.select("Let's play x game",["Start"])
    end
    def player_menu
        Interface.clear
        player_menu_arr = ["New Game", "How TO Play", "Quit"]
        player_input = prompt.select("Welcome #{@player.name}, please select one of these options") do |menu|
            player_menu_arr.each_with_index do |choice|
            menu.choice choice
            end
        end
        menu_choice player_input
    end
    def menu_choice(choice)
        case choice 
         when "New Game"
            self.game_menu
         when "How TO Play"
            puts "Welcome to our game!\r\nHow To Play\r\nYou wake up in an abandoned house, with no memory of how you ended up there.\r\nThe purpose of the game is to navigate through a series of rooms and (hopefully) survive the nasty killers that may be waiting for you in the rooms.\r\nYou can choose to fight or run if you happen to meet a killer, but be careful - there are consequences to both.\r\nWill you make it out?"
            self.continue_to_menu
         when "Quit"
            self.quit_message
         else
            puts "bye" 
        end
    end  
    def main_menu   
        main_menu_arr = ["Sign up"]
        prompt.select("Sign up to get you into the game!") do |menu|
            main_menu_arr.each_with_index do |choice, index|
                menu.choice choice, index
            end
        end
    end
    def game_menu
      game_menu_arr = ["Enter Room","Check Health" ,"Quit"]
      game_input = prompt.select("hey #{@player.name}, Are you brave enought to Enter the room?") do |menu|
             game_menu_arr.each_with_index do |choice|
             menu.choice choice
            end
        end
        game_choice game_input
    end
    def game_choice(choice)
        case choice 
         when "Enter Room"
            self.select_room
         when "Check Health" 
            puts "❤️ "" #{@player.heart}"
         when "Quit"
            self.quit_message
         else
            puts "bye"
        end
    end

    def select_room
     room_name_menu_arr = SelectedRoom.all.map{|room| room.name}
     room_input = prompt.select("Select from below") do |menu|
            room_name_menu_arr.each_with_index do |choice|
            menu.choice choice
         end
       end
       room_name room_input
    end
    def room_name(choice)
        case choice 
         when "living room"
            self.living_room_menu
            self.continue_or_exit
         when "kitchen"
            self.kitchen_room_menu
            self.continue_or_exit
         when "basement"
            self.basement_room_menu
            self.continue_or_exit
         when "master bedroom"
            self.master_room_menu
            self.continue_or_exit
         when "library"
            self.library_room_menu
            self.continue_or_exit
         when "dining room"
            self.dining_room_menu
            self.continue_or_exit
         when "chimney room"
            self.chimney_room_menu
            self.continue_or_exit
         when "garage"
            self.garage_room_menu
            self.continue_or_exit
         else
            puts "bye"
        end
    end





   #room menu=room description/turn on flashlight/quit
   def living_room_menu
    room_menu_arr = ["Room Description","Turn on Flashlight" ,"Quit"]
    room_input = prompt.select("You are inside the living room whats your next step") do |menu|
           room_menu_arr.each_with_index do |choice|
           menu.choice choice
          end
      end
      living_room_choice room_input
  end
  def living_room_choice(choice)
     case choice 
       when "Room Description"
        puts "a relatively clean room with cupboards, a single mattress on the floor, and a low table."
        # puts self.list_room_description
       when "Turn on Flashlight"
           self.flash_light
      when "Quit"
        self.quit_message
      else
        puts "bye"
     end
  end

  def kitchen_room_menu
    room_menu_arr = ["Room Description","Turn on Flashlight" ,"Quit"]
    room_input = prompt.select("let's go to kitchen maybe we will find food whats your next step") do |menu|
           room_menu_arr.each_with_index do |choice|
           menu.choice choice
          end
      end
      kitchen_room_choice room_input
  end
  def kitchen_room_choice(choice)
     case choice 
       when "Room Description"
        puts "windowless kitchen with bloody broken tiled floor,some sharp knives on the shelf"
        # puts self.list_room_description
       when "Turn on Flashlight"
        self.flash_light
      when "Quit"
        self.quit_message
      else
        puts "bye"
     end
  end

  def basement_room_menu
    room_menu_arr = ["Room Description","Turn on Flashlight" ,"Quit"]
    room_input = prompt.select("That is not a wise choice but lets go down,whats your next step") do |menu|
           room_menu_arr.each_with_index do |choice|
           menu.choice choice
          end
      end
      basement_room_choice room_input
  end
  def basement_room_choice(choice)
     case choice 
       when "Room Description"
        puts "chilly dark airless rustic"
        # puts self.list_room_description
       when "Turn on Flashlight"
        self.flash_light
      when "Quit"
        self.quit_message
      else
        puts "bye"
     end
  end

  def master_room_menu
    room_menu_arr = ["Room Description","Turn on Flashlight" ,"Quit"]
    room_input = prompt.select("the cold came from master bedroom ,close the window!whats your next step") do |menu|
           room_menu_arr.each_with_index do |choice|
           menu.choice choice
          end
      end
      master_room_choice room_input
  end
  def master_room_choice(choice)
     case choice 
       when "Room Description"
        puts "large featureless and empty"
        # puts self.list_room_description
       when "Turn on Flashlight"
        self.flash_light
      when "Quit"
        self.exit_message
      else
        puts "bye"
     end
  end

  def library_room_menu
    room_menu_arr = ["Room Description","Turn on Flashlight" ,"Quit"]
    room_input = prompt.select("you are inside the library hopefully the killer is not a reader!whats your next step") do |menu|
           room_menu_arr.each_with_index do |choice|
           menu.choice choice
          end
      end
      library_room_choice room_input
  end
  def library_room_choice(choice)
     case choice 
       when "Room Description"
        puts "dim, wood-paneled old and somewhat valuable"
        # puts self.list_room_description
       when "Turn on Flashlight"
        self.flash_light
      when "Quit"
        self.quit_message
      else
        puts "bye"
     end
  end
  def dining_room_menu
    room_menu_arr = ["Room Description","Turn on Flashlight" ,"Quit"]
    room_input = prompt.select("lets checkout the dining room!whats your next step") do |menu|
           room_menu_arr.each_with_index do |choice|
           menu.choice choice
          end
      end
      dining_room_choice room_input
  end
  def dining_room_choice(choice)
     case choice 
       when "Room Description"
        puts "hideously dark-blue with bleached spotless table but broken chair pieces everywhere"
        # puts self.list_room_description
       when "Turn on Flashlight"
         self.flash_light
      when "Quit"
        self.quit_message
      else
        puts "bye"
     end
  end

  def chimney_room_menu
    room_menu_arr = ["Room Description","Turn on Flashlight" ,"Quit"]
    room_input = prompt.select("well all the wierd sounds comes from here!whats your next step") do |menu|
           room_menu_arr.each_with_index do |choice|
           menu.choice choice
          end
      end
      chimney_room_choice room_input
  end
  def chimney_room_choice(choice)
     case choice 
       when "Room Description"
        puts "unfinished smelly sorounded by chinchillas"
        # puts self.list_room_description
       when "Turn on Flashlight"
        self.chimney_flash_light
      when "Quit"
        self.quit_message
      else
        puts "bye"
     end
  end

  def garage_room_menu
    room_menu_arr = ["Room Description","Turn on Flashlight" ,"Quit"]
    room_input = prompt.select("why garage?but ok ... it's your game!whats your next step") do |menu|
           room_menu_arr.each_with_index do |choice|
           menu.choice choice
          end
      end
     garage_room_choice room_input
  end
  def garage_room_choice(choice)
     case choice 
       when "Room Description"
        puts "explosively hot oversize timbered"
        # puts self.list_room_description
       when "Turn on Flashlight"
        self.flash_light
      when "Quit"
        self.quit_message
      else
        puts "bye"
     end
  end

  def flash_light
        light_menu_arr = ["Let's find out", "Move to other room", "Become Serialkiller","Quit"]
        light_input = prompt.select("you turned on the flash light...oh wait there is someone standing there!who is it?") do |menu|
               light_menu_arr.each_with_index do |choice|
               menu.choice choice
              end
          end
          flash_light_choice light_input
      end
      def flash_light_choice(choice)
         case choice 
           when "Let's find out"
            Interface.clear
            self.flash_light_menu #dont forget to move react under this

            # puts self.list_room_description
           when "Move to other room"
            self.select_room
           when "Become Serialkiller"
            self.become_serial_killer
          when "Quit"
            self.quit_message
          else
            puts "bye"
        end
    end
    
    
    
 #flash_light_helper_method
  def flash_light_menu
     self.list_room_killer 
       lets_find_out_menu_arr = ["React"]
       find_input = prompt.select("It's time to act!") do |menu|
          lets_find_out_menu_arr.each_with_index do |choice|
         menu.choice choice
        end
    end
     find_out_choice find_input
   end
   def find_out_choice(choice)
    case choice 
      when "React"
       self.reaction_menu #dont forget to move react under this
      else
        puts "bye"
      end
    end

    #escape room methods###################################################################################################

    def chimney_flash_light
        light_menu_arr = ["Let's find out", "Move to other room", "Become Serialkiller","Quit"]
        light_input = prompt.select("you turned on the flash light...oh wait there is someone standing there!who is it?") do |menu|
               light_menu_arr.each_with_index do |choice|
               menu.choice choice
              end
          end
          chimney_flash_light_choice light_input
      end
      def chimney_flash_light_choice(choice)
         case choice 
           when "Let's find out"
            Interface.clear
            self.chimney_flash_light_menu #dont forget to move react under this

            # puts self.list_room_description
           when "Move to other room"
            self.select_room
           when "Become Serialkiller"
            self.become_serial_killer
          when "Quit"
            self.quit_message
          else
            puts "bye"
        end
    end

    def chimney_flash_light_menu
        self.list_room_killer 
          lets_find_out_menu_arr = ["React","Run Away from chimney"]
          find_input = prompt.select("It's time to act!") do |menu|
             lets_find_out_menu_arr.each_with_index do |choice|
            menu.choice choice
           end
       end
        chimney_find_out_choice find_input
      end
      def chimney_find_out_choice(choice)
       case choice 
         when "Run Away from chimney"
        self.win 
         when "React"
          self.reaction_menu #dont forget to move react under this
        end
    end
   
    

  ############################################################
  
    
    def list_room_killer
      puts SerialKiller.all.map{|killer| killer.bio}.sample
  end

   def list_room_description
     SelectedRoom.all.map{|room| room.description}.sample
  end
  
  def become_serial_killer
      new_serial_killer = SerialKiller.create({name: @player.name, bio: "#{@player.name} became a serial killer on #{date}"})
      print new_serial_killer.name
      print new_serial_killer.bio
      puts "\n"
    end

    def reaction_menu
        reaction_arr = ["Fight", "Run to next Room"]
        reaction_input = prompt.select("Will you choose to fight or try running to the next room?") do |menu|
            reaction_arr.each_with_index do |choice|
            menu.choice choice
            end
        end
        reaction_choice reaction_input
    end

    def reaction_choice(choice)
        case choice
        when "Fight"
            puts "Oops! You tried to fight a serial killer. You've lost."
            self.death_menu
        when "Run to next Room"
           @player.update(heart: @player.heart -= 1)
            puts "You ran like a coward, but managed to survive. You lose 1 point of health. You're now at ❤️ "" #{@player.heart} lives!"
            if @player.heart == 0
                puts "ohoh you ran out of blood and you died in the middle of the way"
                self.main_menu
            end
            self.select_room    
        else
            self.game_choice
        end
    end

    def death_menu
        death_arr = ["Try Again", "Exit"]
        death_input = prompt.select("Would you like to try again or exit the game?") do |menu|
            death_arr.each_with_index do |choice|
            menu.choice choice
            end
        end
        death_choice death_input
    end

    def death_choice(choice)
        case choice
        when "Try Again"
            self.game_menu
        when "Exit"
            self.player_menu
        else
            "bye"
        end
    end

    def win
       if @player.heart > 1
        puts "You made it out alive, #{@player.name}!you won this life👻"
       elsif
        puts "you got stuck and you died in chimney"
       end
    end

    def health_status
        # @player.update
        puts "❤️ "" #{@player.heart}"
    end
#    def flash_light
#    end

#    #helper room.seriall_killer
#    def room_status
#     SelectedRoom.all.map
###############################################################################################
#cli_helper


    def self.clear
      system "clear"
   end

    def exit_message
        puts " Game Over!"
    end

    def quit_message
        puts"you gave up"
        Interface.clear
    end

    def continue_or_exit
       answer = prompt.select("Continue or exit?", ["Continue ", "Exit"])
       if answer == "Exit"
        self.exit_message
       elsif answer == "Continue "
        puts "\n"
        self.health_status
        self.select_room
        Interface.clear
        puts "\n"
        
       end
    end
    def continue_to_menu
        answer = prompt.select("Continue?", ["Continue "])
         if answer == "Continue "
         puts "\n"
         self.game_menu
         Interface.clear
         puts "\n"
        end
     end
    def date
     Time.now.strftime("%d/%m/%Y %H:%M")
    end

end

 # def sign_up
    #     username = prompt.ask("Welcome, fresh meat! What's your name?")
    #     return self.sign_in if Player.find_by(name: username)
    #     @player = Player.create({name: username, heart: 5})
    #     #new user gets added to db
    # end

    # def sign_in
    #     player = prompt.ask("Oh i remember you! What was your name again? ")
    #     @player = Player.find_by(name: player)
    #     @player.nil? ? new_player : @player
    # end

