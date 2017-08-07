# == Schema Information
#
# Table name: messages
#
#  id                :integer          not null, primary key
#  sender_id         :integer          not null
#  receiver_id       :integer          not null
#  body              :text
#  is_sender_read    :boolean          default(FALSE)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  message_thread_id :integer          not null
#  is_receiver_read  :boolean
#

require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
