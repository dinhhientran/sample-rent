class AddMessageThreadIdIntoMessage < ActiveRecord::Migration
  def change
    add_column :messages, :message_thread_id, :integer, :null => false
  end
end
