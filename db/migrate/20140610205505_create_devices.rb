class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices, id: false do |t|
      t.integer :device_id
      t.integer :gw_id
      t.integer :plant_wall_id
      t.string :name
      t.string :category
    end
    execute "ALTER TABLE devices ADD PRIMARY KEY(device_id, gw_id);"
    add_index :devices, [ :device_id, :gw_id]
  end

end
