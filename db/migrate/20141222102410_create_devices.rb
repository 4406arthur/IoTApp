class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.references :plant_wall
      t.string :name
      t.string :category
      t.string :path

      t.timestamps
    end
  end
end
