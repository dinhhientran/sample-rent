# == Schema Information
#
# Table name: cars
#
#  id          :integer          not null, primary key
#  brand       :string
#  model       :string
#  seat        :integer
#  color       :string
#  price       :integer
#  public_year :integer
#  description :text
#  user_id     :integer
#  activate    :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :string
#

require 'test_helper'

class CarTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
