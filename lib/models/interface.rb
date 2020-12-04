
class Interface

    attr_accessor :prompt

    def initialize
        @prompt = TTY::Prompt.new
    end

    $player = ""

    def run
        self.start
        self.main_menu
        self.sign_up
        self.sign_in
        self.player_menu
    end

    def sign_up
        username = prompt.ask("Welcome, fresh meat! What's your name?")
        return $player if Player.find_by(name: username)
    
        $player = Player.create({name: username})
        #new user gets added to db
    end

    def sign_in
        player = prompt.ask("Oh i remember you! What was your name again? ")
        $player = Player.find_by(name: player)
        $player.nil? ? new_player : $player
    end

    def start 
        prompt.select("lets play this game",["Start"])
 
    end

    def player_menu_arr
        ["New Game", "How TO Play", "Quit"]
    end
    
    def player_menu
        prompt.select("Welcome back #{$player.name}, how may I be of service?") do |menu|
            player_menu_arr.each_with_index do |choice, index|
                menu.choice choice, index
            end
        end
    end
    
    def main_menu_arr
        ["Sign up","Sign in"]
    end
    
    def main_menu   
        
        prompt.select("lets get you into game") do |menu|
            main_menu_arr.each_with_index do |choice, index|
                menu.choice choice, index
            end
        end
    end
    
    
    
end