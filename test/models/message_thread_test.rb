# == Schema Information
#
# Table name: message_threads
#
#  id                :integer          not null, primary key
#  started_user_id   :integer
#  to_user_id        :integer
#  latest_message_id :integer
#  subject           :string
#  is_deleted        :boolean
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class MessageThreadTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
