class CreateSelectedRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :selected_rooms do |t|  
      t.integer :serial_killer_id
      t.integer :player_id
      t.string :description
      t.string :name
    end
  end
end
