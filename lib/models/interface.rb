
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
        return self.sign_in if Player.find_by(name: username)
        @player = Player.create({name: username})
        #new user gets added to db
    end

    def sign_in
        player = prompt.ask("Oh i remember you! What was your name again? ")
        @player = Player.find_by(name: player)
        @player.nil? ? new_player : @player
    end

    def start 
        prompt.select("lets play this game",["Start"])
    end
    def player_menu
        player_menu_arr = ["New Game", "How TO Play", "Quit"]
        player_input = prompt.select("Welcome back #{@player.name}, please select one of these options") do |menu|
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
            puts "hi"
         when "Quit"
            puts "die"
         else
            puts "bye" 
        end
    end  
    def main_menu   
        main_menu_arr = ["Sign up","Sign in"]
        prompt.select("lets get you into game") do |menu|
            main_menu_arr.each_with_index do |choice, index|
                menu.choice choice, index
            end
        end
    end
    def game_menu
      game_menu_arr = ["Enter Room","Health" ,"Quit"]
      game_input = prompt.select("hey #{@player.name}, Are you brave enought to Enter the room?") do |menu|
             game_menu_arr.each_with_index do |choice|
             menu.choice choice
            end
        end
        menu_choice game_input
    end
    def game_choice(choice)
        case choice 
         when "Enter Room"
            puts "boo"
         when "Health"
            puts "bar"
         when "Quit"
            puts "die"
         else
            puts "bye"
        end
    end

    room menu=room description/turn on flashlight/quit
    
    
  
end