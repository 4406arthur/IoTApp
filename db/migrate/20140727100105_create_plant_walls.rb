class CreatePlantWalls < ActiveRecord::Migration
  def change
    create_table :plant_walls do |t|
      t.integer :swot_user_id
      t.string :name
      t.string :location

      t.timestamps
    end
  end
end
