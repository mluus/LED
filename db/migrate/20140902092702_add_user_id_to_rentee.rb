class AddUserIdToRentee < ActiveRecord::Migration
  def change
    add_column :rentees, :user_id, :integer
  end
end
