class CreateSwotUsers < ActiveRecord::Migration
  def change
    create_table :swot_users do |t|
      t.integer :fb_id
      t.integer :gw_id
      t.string  :name

      t.timestamps
    end
  end
end
