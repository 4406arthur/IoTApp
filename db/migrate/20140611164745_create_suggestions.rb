class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.string :content
      t.integer :swot_user_id

      t.timestamps
    end
    add_index :suggestions, [:swot_user_id, :created_at]
  end
end
