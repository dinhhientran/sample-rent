# == Schema Information
#
# Table name: cars
#
#  id                 :integer          not null, primary key
#  brand              :string
#  model              :string
#  seat               :integer
#  color              :string
#  price              :integer
#  public_year        :integer
#  description        :text
#  user_id            :integer
#  activate           :boolean
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

require 'test_helper'

class CarTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
