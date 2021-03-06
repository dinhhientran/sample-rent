# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string
#  last_name              :string
#  city                   :string
#  address                :string
#  phone_number           :string
#  coordinates            :geography({:srid point, 4326
#  avatar_file_name       :string
#  avatar_content_type    :string
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "http://www.ecijagamingcommunity.com/wp-content/themes/cwp-youit/images/no-image-default.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :city, :presence => true
  validates :address, :presence => true
  validates :phone_number, :presence => true, length: { is: 10, wrong_length: "must be %{count} digits" }

  attr_reader :latitude, :longitude

  def equal_user?(user)
    return !user.nil? && id == user.id;
  end

  def full_name
    return first_name + " " + last_name
  end

  def full_address
    return address + ", " + city
  end

  def latitude
    coordinates.lat if coordinates
  end

  def longitude
    coordinates.lon if coordinates
  end
end
