class ChangeReadFlagsInMessages < ActiveRecord::Migration
  def up
    rename_column :messages, :is_read, :is_sender_read
    change_column_default :messages, :is_read, false
    add_column :messages, :is_receiver_read, :boolean, :after => :is_sender_read
  end

  def down
    change_column_default :messages, :is_sender_read, nil
    rename_column :messages, :is_sender_read, :is_read
    remove_column :messages, :is_receiver_read
  end
end
