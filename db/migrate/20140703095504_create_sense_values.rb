class CreateSenseValues < ActiveRecord::Migration
  def change
    create_table :sense_values do |t|     
      t.integer :device_id
      t.float :data
      t.text :description

      t.timestamps
    end
    
  end
end
