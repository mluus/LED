class CreateRentees < ActiveRecord::Migration
  def change
    create_table :rentees do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.integer :tokens

      t.timestamps
    end
  end
end
