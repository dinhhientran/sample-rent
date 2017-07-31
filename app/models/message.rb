# == Schema Information
#
# Table name: messages
#
#  id           :integer          not null, primary key
#  from_user_id :integer          not null
#  to_user_id   :integer          not null
#  subject      :string
#  body         :text
#  is_read      :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Message < ActiveRecord::Base
  belongs_to :from_user, class_name: User
  belongs_to :to_user, class_name: User
end
