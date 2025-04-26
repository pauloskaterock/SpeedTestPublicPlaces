
class AddPlacesTable < ActiveRecord::Migration[8.0]
  def change
    create_table :internet_speeds, id: :uuid do |t| 
      t.float :download_speed, null: false
      t.string :download_speed_unit, null: false

      t.timestamps
    end
  end
end