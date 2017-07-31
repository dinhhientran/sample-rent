class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :from_user_id, null: false
      t.integer :to_user_id, null: false
      t.string :subject
      t.text :body
      t.boolean :is_read

      t.timestamps null: false
    end

    add_index :messages, :from_user_id
    add_index :messages, :to_user_id

    add_foreign_key :messages, :users, column: :from_user_id
    add_foreign_key :messages, :users, column: :to_user_id
  end
end
