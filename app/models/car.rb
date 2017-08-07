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

class Car < ActiveRecord::Base
	belongs_to :user

	mount_uploader :image, ImageUploader

	validates :brand, presence: true, length: { minimum: 3 }
	validates :model, presence: true, length: { minimum: 2 }

	scope :latest_cars, -> { limit(4).order('created_at DESC') }
	scope :of_user, ->(user) { where('user_id = ?', user.id).order('created_at DESC') }

	# Get all car activated
	def self.get_cars()
		where("activate == true")
		order('created_at DESC')
	end

	# Search Car base on Brand, Model or Description
	def self.search(search)
	  where("brand LIKE ? OR model LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
	end

end
