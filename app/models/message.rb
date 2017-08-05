# == Schema Information
#
# Table name: messages
#
#  id                :integer          not null, primary key
#  sender_id         :integer          not null
#  receiver_id       :integer          not null
#  subject           :string
#  body              :text
#  is_read           :boolean
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  message_thread_id :integer
#

class Message < ActiveRecord::Base
  belongs_to :message_thread
  belongs_to :sender, :class_name => "User", :foreign_key => "sender_id"
  belongs_to :receiver, :class_name => "User", :foreign_key => "receiver_id"

  def self.count_unread_messages(user_id)
    Message.joins(:message_thread)
      .where("message_threads.started_user_id = ? OR message_threads.to_user_id = ?", user_id, user_id).count
  end
end
