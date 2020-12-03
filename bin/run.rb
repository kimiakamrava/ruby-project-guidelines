require_relative '../config/environment'

interface = Interface.new
interface.run

# name of the game (ascii)

# main menu sign up/sign_in
def main_menu
    ["Sign up","Sign in"]
end

# player menu :  new game, how to play,quit(loop:main menu)
def player_menu
    ["New Game", "How TO Play", "Quit"]
end


# game menu: enter room/health stat/quit
def game_menu
    ["Enter Room","Health" ,"Quit"]
end

# room menu=room description/turn on flashlight/quit
def room_menu
    ["Room Description","Turn on Flashlight","Quit"]
end


# when flash light on=>

# if empty=> (room empty) => move next room

#   if serial killer(puts name)=>    hear their bio 

# reaction menu= 
def reaction_menu
  ["Fight","Run"]
end

# fight=>(you tried to fight a killer you died),
def die_menu
  ["Try Again"]
end
# die menu=>try agian button=>loop(player menu)

# run=>(killer attacked you but you ran)=>move to another room+loose health

# loop(game menu)

