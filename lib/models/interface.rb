
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
        if Player.find_by(name: username)
            return self.sign_in
        else
        @player = Player.create({name: username, heart: 3})
        end
        #new user gets added to db
    end

    def sign_in
        player = prompt.ask("Oh, I remember you! Press enter to jump in to the game.")
        @player = Player.find_by(name: player, heart: 3)
        @player.nil? ? new_player : @player
    end

    def start 
        prompt.select("Let's play x game",["Start"])
    end
    def player_menu
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
            puts "hi"
         when "Quit"
            puts "die"
         else
            puts "bye" 
        end
    end  
    def main_menu   
        main_menu_arr = ["Sign up","Sign in"]
        prompt.select("Sign Up if you're a new player, and Sign In if you're a returning player.") do |menu|
            main_menu_arr.each_with_index do |choice, index|
                menu.choice choice, index
            end
        end
    end
    def game_menu
      game_menu_arr = ["Enter Room","Check Health" ,"Quit"]
      game_input = prompt.select("Hey #{@player.name}, Are you brave enough to enter the room?") do |menu|
             game_menu_arr.each_with_index do |choice|
             menu.choice choice
            end
        end
        game_choice game_input
    end
    def game_choice(choice)
        case choice 
         when "Enter Room"
            puts "boo"
         when "Check Health"
            puts "❤️ "" #{@player.heart}"
         when "Quit"
            puts "die"
         else
            puts "bye"
        end
    end
end