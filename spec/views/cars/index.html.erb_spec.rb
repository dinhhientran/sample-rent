require 'rails_helper'

RSpec.describe "cars/index", type: :view do
  before(:each) do
    assign(:cars, [
      Car.create!(
        :brand => "Brand",
        :model => "Model",
        :seat => 1,
        :color => "Color",
        :price => 2,
        :public_year => 3,
        :description => "MyText",
        :user_id => 4,
        :activate => false
      ),
      Car.create!(
        :brand => "Brand",
        :model => "Model",
        :seat => 1,
        :color => "Color",
        :price => 2,
        :public_year => 3,
        :description => "MyText",
        :user_id => 4,
        :activate => false
      )
    ])
  end

  it "renders a list of cars" do
    render
    assert_select "tr>td", :text => "Brand".to_s, :count => 2
    assert_select "tr>td", :text => "Model".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Color".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
