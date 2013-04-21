require 'spec_helper'

describe "matches/index" do
  before(:each) do
    assign(:matches, [
      stub_model(Match,
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
      ),
      stub_model(Match,
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
      )
    ])
  end

  it "renders a list of matches" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Opponent".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Center".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "Rw".to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => "Lw".to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
    assert_select "tr>td", :text => 8.to_s, :count => 2
    assert_select "tr>td", :text => "Def1".to_s, :count => 2
    assert_select "tr>td", :text => 9.to_s, :count => 2
    assert_select "tr>td", :text => 10.to_s, :count => 2
    assert_select "tr>td", :text => "Def2".to_s, :count => 2
    assert_select "tr>td", :text => 11.to_s, :count => 2
    assert_select "tr>td", :text => 12.to_s, :count => 2
    assert_select "tr>td", :text => "Goalie".to_s, :count => 2
  end
end
