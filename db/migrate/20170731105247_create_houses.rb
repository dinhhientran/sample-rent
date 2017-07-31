class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.integer :user_id, null:false
      t.string :title
      t.string :city
      t.text :address
      t.decimal :cost
      t.text :description

      t.timestamps null: false
    end

    add_index :houses, :user_id

    add_foreign_key :houses, :users, column: :user_id
  end
end
