class Car < ActiveRecord::Base
	belongs_to :users
	validates :brand, presence: true, length: { minimum: 3 }
	validates :model, presence: true, length: { minimum: 2 }
end
