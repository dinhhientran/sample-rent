# == Schema Information
#
# Table name: houses
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  title       :string
#  city        :string
#  address     :text
#  cost        :decimal(, )
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class HouseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
