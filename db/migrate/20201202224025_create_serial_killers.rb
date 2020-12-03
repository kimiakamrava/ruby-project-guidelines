class CreateSerialKillers < ActiveRecord::Migration[5.2]
  def change
    create_table :serial_killers do |t|
      t.string :name
      t.text :bio
      
    end
  end
end
