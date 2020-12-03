  
class SelectedRoom < ActiveRecord::Base
    belongs_to :player
    belongs_to :serial_killer
end