class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.string :content
      t.integer :swot_user_id

      t.timestamps
    end
    execute "ALTER TABLE suggestions CHANGE swot_user_id swot_user_id  BIGINT(11);"
    add_index :suggestions, [:swot_user_id, :created_at]
  end
end
