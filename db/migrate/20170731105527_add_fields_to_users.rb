class AddFieldsToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :city
      t.string :address
      t.string :phone_number
    end
  end
end
