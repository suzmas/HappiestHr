require 'rails_helper'

RSpec.describe "bars/edit", type: :view do
  before(:each) do
    @bar = assign(:bar, Bar.create!(
      :name => "MyString",
      :street => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip => "MyString"
    ))
  end

  it "renders the edit bar form" do
    render

    assert_select "form[action=?][method=?]", bar_path(@bar), "post" do

      assert_select "input#bar_name[name=?]", "bar[name]"

      assert_select "input#bar_street[name=?]", "bar[street]"

      assert_select "input#bar_city[name=?]", "bar[city]"

      assert_select "input#bar_state[name=?]", "bar[state]"

      assert_select "input#bar_zip[name=?]", "bar[zip]"
    end
  end
end
