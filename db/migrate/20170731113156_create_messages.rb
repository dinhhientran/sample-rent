class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender_id, null: false
      t.integer :receiver_id, null: false
      t.string :subject
      t.text :body
      t.boolean :is_read

      t.timestamps null: false
    end

    add_index :messages, :sender_id
    add_index :messages, :receiver_id

    add_foreign_key :messages, :users, column: :sender_id
    add_foreign_key :messages, :users, column: :receiver_id
  end
end
