require 'spec_helper'

describe "matches/show" do
  before(:each) do
    @match = assign(:match, stub_model(Match,
      :opponent => "Opponent",
      :gScored => 1,
      :gLetIn => 2,
      :Center => "Center",
      :pCenter => 3,
      :hCenter => 4,
      :RW => "Rw",
      :pRW => 5,
      :hRW => 6,
      :LW => "Lw",
      :pLW => 7,
      :hLW => 8,
      :Def1 => "Def1",
      :pDef1 => 9,
      :hDef1 => 10,
      :Def2 => "Def2",
      :pDef => 11,
      :hDef => 12,
      :Goalie => "Goalie"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Opponent/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Center/)
    rendered.should match(/3/)
    rendered.should match(/4/)
    rendered.should match(/Rw/)
    rendered.should match(/5/)
    rendered.should match(/6/)
    rendered.should match(/Lw/)
    rendered.should match(/7/)
    rendered.should match(/8/)
    rendered.should match(/Def1/)
    rendered.should match(/9/)
    rendered.should match(/10/)
    rendered.should match(/Def2/)
    rendered.should match(/11/)
    rendered.should match(/12/)
    rendered.should match(/Goalie/)
  end
end
