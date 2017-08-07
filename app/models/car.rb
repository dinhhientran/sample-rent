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

class Car < ActiveRecord::Base
	belongs_to :user

	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "http://www.ecijagamingcommunity.com/wp-content/themes/cwp-youit/images/no-image-default.png"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

	validates :brand, presence: true, length: { minimum: 3 }
	validates :model, presence: true, length: { minimum: 2 }

	scope :latest_cars, -> { limit(4).order('created_at DESC') }
	scope :of_user, ->(user) { where('user_id = ?', user.id).order('created_at DESC') }
	
	# Get all car activated
	scope :get_cars, -> { order('created_at DESC') }

	# Search Car base on Brand, Model or Description
	def self.search(search)
	  where("brand LIKE ? OR model LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
	end

end
