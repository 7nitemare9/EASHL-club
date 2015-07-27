require 'rails_helper'

RSpec.describe "schedules/index", :type => :view do
  before(:each) do
    assign(:schedules, [
      Schedule.create!(
        :logo => "Logo"
      ),
      Schedule.create!(
        :logo => "Logo"
      )
    ])
  end

  it "renders a list of schedules" do
    render
    assert_select "tr>td", :text => "Logo".to_s, :count => 2
  end
end
