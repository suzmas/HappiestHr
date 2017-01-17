require 'rails_helper'

RSpec.describe "events/new", type: :view do
  before(:each) do
    assign(:event, Event.new(
      :name => "MyString",
      :day => "MyString",
      :bar => nil
    ))
  end

  it "renders new event form" do
    render

    assert_select "form[action=?][method=?]", events_path, "post" do

      assert_select "input#event_name[name=?]", "event[name]"

      assert_select "input#event_day[name=?]", "event[day]"

      assert_select "input#event_bar_id[name=?]", "event[bar_id]"
    end
  end
end
