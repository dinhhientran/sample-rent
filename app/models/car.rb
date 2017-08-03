# == Schema Information
#
# Table name: cars
#
#  id          :integer          not null, primary key
#  marquee     :string
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
#

class Car < ActiveRecord::Base
	belongs_to :users

	mount_uploader :image, ImageUploader

	validates :brand, presence: true, length: { minimum: 3 }
	validates :model, presence: true, length: { minimum: 2 }
end
