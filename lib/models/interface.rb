
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
        #new user gets added to db
    end

    def start 
        prompt.select("Let's play x game",["Start"])
    end
    def player_menu
        player_menu_arr = ["New Game", "How To Play", "Quit"]
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
         when "How To Play"
            puts "Welcome to our game!\r\nHow To Play\r\nYou wake up in an abandoned house, with no memory of how you ended up there.\r\nThe purpose of the game is to navigate through a series of rooms and (hopefully) survive the nasty killers that may be waiting for you in the rooms.\r\nYou can choose to fight or run if you happen to meet a killer, but be careful - there are consequences to both.\r\nWill you make it out?"
         when "Quit"
            puts "die"
         else
            puts "bye" 
        end
    end  
    def main_menu   
        main_menu_arr = ["Sign up"]
        prompt.select("Sign Up as a new player") do |menu|
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
            return self.reaction_menu
         when "Check Health"
            puts "❤️ "" #{@player.heart}"
         when "Quit"
            puts "die"
         else
            puts "bye"
        end
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
                puts "U ded!!"
            end
            self.game_menu
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
            self.game_choice(choice)
        when "Exit"
            self.main_menu
        else
            "bye"
        end
    end






end