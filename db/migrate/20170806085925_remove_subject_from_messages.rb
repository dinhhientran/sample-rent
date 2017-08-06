class RemoveSubjectFromMessages < ActiveRecord::Migration
  def up
    remove_column :messages, :subject
  end

  def down
    add_column :messages, :subject, :text
  end
end
