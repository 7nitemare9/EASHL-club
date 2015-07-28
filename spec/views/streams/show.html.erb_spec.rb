require 'rails_helper'

RSpec.describe "streams/show", :type => :view do
  before(:each) do
    @stream = assign(:stream, Stream.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
