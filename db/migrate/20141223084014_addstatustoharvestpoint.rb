class Addstatustoharvestpoint < ActiveRecord::Migration
  def change
    add_column :harvest_points, :status, :integer
  end
end
