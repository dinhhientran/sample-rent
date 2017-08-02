class CreateMessageThreads < ActiveRecord::Migration
  def change
    create_table :message_threads do |t|
      t.integer :started_user_id
      t.integer :to_user_id
      t.integer :latest_message_id
      t.string :subject
      t.boolean :is_deleted
      t.timestamps null: false
    end

    add_foreign_key :message_threads, :users, column: :started_user_id
    add_foreign_key :message_threads, :users, column: :to_user_id
    add_foreign_key :message_threads, :messages, column: :latest_message_id

    add_index :message_threads, :started_user_id
    add_index :message_threads, :to_user_id
    add_index :message_threads, :latest_message_id
  end
end
