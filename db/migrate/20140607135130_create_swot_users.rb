class CreateSwotUsers < ActiveRecord::Migration
  def change
    create_table :swot_users do |t|
      t.integer :fb_id
      t.integer :gateway_id

      t.timestamps
    end
  end
end
