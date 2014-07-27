class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.integer :plant_wall_id
      t.string :content

      t.timestamps
    end
    add_index :suggestions, [:plant_wall_id, :created_at]
  end
end
