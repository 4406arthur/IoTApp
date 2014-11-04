class AddPathToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :path, :string
  end
end
