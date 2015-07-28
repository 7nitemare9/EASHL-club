require 'rails_helper'

RSpec.describe "streams/new", :type => :view do
  before(:each) do
    assign(:stream, Stream.new(
      :name => "MyString"
    ))
  end

  it "renders new stream form" do
    render

    assert_select "form[action=?][method=?]", streams_path, "post" do

      assert_select "input#stream_name[name=?]", "stream[name]"
    end
  end
end
