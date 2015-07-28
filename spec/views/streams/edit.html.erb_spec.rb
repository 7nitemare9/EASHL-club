require 'rails_helper'

RSpec.describe "streams/edit", :type => :view do
  before(:each) do
    @stream = assign(:stream, Stream.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit stream form" do
    render

    assert_select "form[action=?][method=?]", stream_path(@stream), "post" do

      assert_select "input#stream_name[name=?]", "stream[name]"
    end
  end
end
