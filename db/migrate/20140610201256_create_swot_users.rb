class CreateSwotUsers < ActiveRecord::Migration
  def change
    create_table  :swot_users, id: false do |t|
      t.primary_key :gw_id
      t.integer :fb_id
      t.string :name
      t.string :email

      t.timestamps
    end
   execute "ALTER TABLE swot_users CHANGE fb_id fb_id BIGINT(11);"

  end
end
