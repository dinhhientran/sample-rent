# == Schema Information
#
# Table name: message_threads
#
#  id                :integer          not null, primary key
#  started_user_id   :integer
#  to_user_id        :integer
#  latest_message_id :integer
#  is_deleted        :boolean
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  subject           :text
#

class MessageThread < ActiveRecord::Base
  belongs_to :started_user, class_name: User
  belongs_to :to_user, class_name: User
  belongs_to :latest_message, :class_name => "Message", :foreign_key => "latest_message_id"

  has_many :messages, -> {order 'created_at desc'}

  scope :of_user, ->(user) { where("started_user_id = ? OR to_user_id = ?", user.id, user.id).order("created_at desc") }
end
