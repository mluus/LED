class AddDeviceToEngineers < ActiveRecord::Migration
  def change
    add_column :engineers, :device, :string
  end
end
