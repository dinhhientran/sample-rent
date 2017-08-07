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
