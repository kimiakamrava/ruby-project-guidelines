
class Interface

    attr_accessor :prompt

    def initialize
        @prompt = TTY::Prompt.new
    end
    
    $user = ""

    def sign_up
        username = prompt.ask("Welcome, fresh meat! What's your name?")
        return $user if Player.find_by(name: username)
    
        $user = Player.create({name: username})
        #new user gets added to db
    end

    def sign_in
        user = prompt.ask("Oh i remember you! What was your name again? ")
        $user = Player.find_by(name: user)
        $user.nil? ? new_user : $user
    end

   

    
    
end