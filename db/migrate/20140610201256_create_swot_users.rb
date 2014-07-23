class CreateSwotUsers < ActiveRecord::Migration
  def change
    create_table  :swot_users, id: false do |t|
      t.integer :fb_id
      t.integer :gw_id
      t.string  :name

      t.timestamps
    end
   execute "ALTER TABLE swot_users CHANGE fb_id fb_id BIGINT(11);"
   execute "ALTER TABLE swot_users ADD PRIMARY KEY(fb_id);"

  end
end
