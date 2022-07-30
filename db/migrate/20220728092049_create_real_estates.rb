class CreateRealEstates < ActiveRecord::Migration[5.2]
  def change
    create_table :real_estates do |t|
      t.string :owner
      t.string :address
      t.integer :rooms
      t.integer :sqmt
      t.integer :floors
      t.boolean :air_condition
      t.decimal :price
      t.integer :units
      t.integer :shops
      t.integer :parking
      t.string :type

      t.timestamps
    end
  end
end
