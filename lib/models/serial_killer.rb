class SerialKiller < ActiveRecord::Base
    has_many :selected_rooms
    has_many :players, through: :selected_rooms 
end