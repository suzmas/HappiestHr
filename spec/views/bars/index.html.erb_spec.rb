require 'rails_helper'

RSpec.describe "bars/index", type: :view do
  before(:each) do
    assign(:bars, [
      Bar.create!(
        :name => "Name",
        :street => "Street",
        :city => "City",
        :state => "State",
        :zip => "Zip"
      ),
      Bar.create!(
        :name => "Name",
        :street => "Street",
        :city => "City",
        :state => "State",
        :zip => "Zip"
      )
    ])
  end

  it "renders a list of bars" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Street".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Zip".to_s, :count => 2
  end
end
