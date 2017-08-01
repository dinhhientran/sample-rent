class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :marquee
      t.string :model
      t.integer :seat
      t.string :color
      t.integer :price
      t.integer :public_year
      t.text :description
      t.integer :user_id
      t.boolean :activate

      t.timestamps null: false
    end
  end
end
