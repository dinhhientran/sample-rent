# == Schema Information
#
# Table name: messages
#
#  id                :integer          not null, primary key
#  sender_id         :integer          not null
#  receiver_id       :integer          not null
#  body              :text
#  is_sender_read    :boolean
#  is_receiver_read  :boolean
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
      .where("(messages.sender_id = ? AND messages.is_sender_read = false) OR (messages.receiver_id = ? AND messages.is_receiver_read = false)", user_id, user_id).count
  end
end
