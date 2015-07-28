require 'rails_helper'

RSpec.describe "streams/index", :type => :view do
  before(:each) do
    assign(:streams, [
      Stream.create!(
        :name => "Name"
      ),
      Stream.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of streams" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
