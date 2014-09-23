class AddPasswordToEngineers < ActiveRecord::Migration
  def change
    add_column :engineers, :password, :string
  end
end
