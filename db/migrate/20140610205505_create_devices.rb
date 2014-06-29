class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices, id: false do |t|
      t.primary_key :device_id 
      t.integer :swot_user_id
      t.string :name

      t.timestamps
    end
  end
end
