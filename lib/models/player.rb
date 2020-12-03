  
class Player < ActiveRecord::Base
    has_many :selected_rooms
    has_many :serial_killers, through: :selected_rooms
end