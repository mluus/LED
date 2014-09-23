class AddSwitchedToEngineers < ActiveRecord::Migration
  def change
    add_column :engineers, :switched, :boolean
  end
end
