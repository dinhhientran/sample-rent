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

require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
