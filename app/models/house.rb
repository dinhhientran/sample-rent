# == Schema Information
#
# Table name: houses
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  title       :string
#  city        :string
#  address     :text
#  cost        :decimal(, )
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class House < ActiveRecord::Base
  belongs_to :user
end
