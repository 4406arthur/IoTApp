class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices, id: false do |t|
      t.integer :device_id 
      t.integer :swot_user_id
      t.string :name

      t.timestamps
    end

    execute "ALTER TABLE devices ADD PRIMARY KEY (device_id ,swot_user_id);"
    execute "ALTER TABLE devices CHANGE swot_user_id swot_user_id BIGINT(11);"
    add_index :devices, [ "swot_user_id", "device_id"], :unique => true
  end

end
