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
end
