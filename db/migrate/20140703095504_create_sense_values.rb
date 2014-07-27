class CreateSenseValues < ActiveRecord::Migration
  def change
    create_table :sense_values do |t|     
      t.integer :device_id
      t.integer :gw_id
      t.float :data
      t.text :description

      t.timestamps
    end
    add_index :sense_values, [ "device_id", "gw_id"]
  end
end
