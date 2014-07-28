class AddNotNullToSwotUsersFbid < ActiveRecord::Migration
  def change
    change_column_null(:swot_users, :fb_id, false)
  end
end
