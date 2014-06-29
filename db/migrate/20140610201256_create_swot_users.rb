class CreateSwotUsers < ActiveRecord::Migration
  def change
    create_table  :swot_users, id: false do |t|
      t.primary_key :fb_id
      t.integer :gw_id
      t.string  :name

      t.timestamps
    end
   #execute "ALTER TABLE swot_users ADD PRIMARY KEY(fb_id);"
  end
end
