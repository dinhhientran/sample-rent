require 'rails_helper'

RSpec.describe "cars/edit", type: :view do
  before(:each) do
    @car = assign(:car, Car.create!(
      :brand => "MyString",
      :model => "MyString",
      :seat => 1,
      :color => "MyString",
      :price => 1,
      :public_year => 1,
      :description => "MyText",
      :user_id => 1,
      :activate => false
    ))
  end

  it "renders the edit car form" do
    render

    assert_select "form[action=?][method=?]", car_path(@car), "post" do

      assert_select "input#car_brand[name=?]", "car[brand]"

      assert_select "input#car_model[name=?]", "car[model]"

      assert_select "input#car_seat[name=?]", "car[seat]"

      assert_select "input#car_color[name=?]", "car[color]"

      assert_select "input#car_price[name=?]", "car[price]"

      assert_select "input#car_public_year[name=?]", "car[public_year]"

      assert_select "textarea#car_description[name=?]", "car[description]"

      assert_select "input#car_user_id[name=?]", "car[user_id]"

      assert_select "input#car_activate[name=?]", "car[activate]"
    end
  end
end
