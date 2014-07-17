class CreateSenseValues < ActiveRecord::Migration
  def change
    create_table :sense_values do |t|
      t.float :data
      t.integer :device_id
      t.text :description

      t.timestamps
    end
  end
end
