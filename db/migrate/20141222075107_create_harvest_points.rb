class CreateHarvestPoints < ActiveRecord::Migration
  def change
    create_table :harvest_points do |t|
      t.references :plant_wall
      t.string :breed
      t.timestamps
    end
  end
end
