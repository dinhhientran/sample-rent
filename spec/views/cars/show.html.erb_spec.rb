require 'rails_helper'

RSpec.describe "cars/show", type: :view do
  before(:each) do
    @car = assign(:car, Car.create!(
      :brand => "Brand",
      :model => "Model",
      :seat => 1,
      :color => "Color",
      :price => 2,
      :public_year => 3,
      :description => "MyText",
      :user_id => 4,
      :activate => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Brand/)
    expect(rendered).to match(/Model/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Color/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/false/)
  end
end
