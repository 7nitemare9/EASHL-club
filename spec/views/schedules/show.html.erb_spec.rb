require 'rails_helper'

RSpec.describe "schedules/show", :type => :view do
  before(:each) do
    @schedule = assign(:schedule, Schedule.create!(
      :logo => "Logo"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Logo/)
  end
end
