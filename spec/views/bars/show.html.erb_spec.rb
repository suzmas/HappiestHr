require 'rails_helper'

RSpec.describe "bars/show", type: :view do
  before(:each) do
    @bar = assign(:bar, Bar.create!(
      :name => "Name",
      :street => "Street",
      :city => "City",
      :state => "State",
      :zip => "Zip"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Street/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Zip/)
  end
end
