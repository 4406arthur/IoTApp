class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.integer :device_id
      t.integer :swot_user_id
      t.string :name

      t.timestamps
    end
  end
end
