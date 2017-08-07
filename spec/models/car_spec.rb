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

require 'rails_helper'

RSpec.describe Car, type: :model do
  context "associations" do
    it {is_expected.to belong_to :user}
  end

  context "validates" do
    it {is_expected.to validate_presence_of :brand}
    it {is_expected.to validate_presence_of :model}
  end
end
