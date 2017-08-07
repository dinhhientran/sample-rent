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

require 'rails_helper'

RSpec.describe User, type: :model do
  context "validates" do
    it {is_expected.to validate_presence_of :first_name}
    it {is_expected.to validate_presence_of :last_name}
    it {is_expected.to validate_presence_of :city}
    it {is_expected.to validate_presence_of :address}
    it {is_expected.to validate_presence_of :phone_number}
    it {is_expected.to validate_length_of(:phone_number).is_at_least(10).with_message(/must be 10 digits/) }
  end
end
