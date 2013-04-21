require 'spec_helper'

describe "matches/new" do
  before(:each) do
    assign(:match, stub_model(Match,
      :opponent => "MyString",
      :gScored => 1,
      :gLetIn => 1,
      :Center => "MyString",
      :pCenter => 1,
      :hCenter => 1,
      :RW => "MyString",
      :pRW => 1,
      :hRW => 1,
      :LW => "MyString",
      :pLW => 1,
      :hLW => 1,
      :Def1 => "MyString",
      :pDef1 => 1,
      :hDef1 => 1,
      :Def2 => "MyString",
      :pDef => 1,
      :hDef => 1,
      :Goalie => "MyString"
    ).as_new_record)
  end

  it "renders new match form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => matches_path, :method => "post" do
      assert_select "input#match_opponent", :name => "match[opponent]"
      assert_select "input#match_gScored", :name => "match[gScored]"
      assert_select "input#match_gLetIn", :name => "match[gLetIn]"
      assert_select "input#match_Center", :name => "match[Center]"
      assert_select "input#match_pCenter", :name => "match[pCenter]"
      assert_select "input#match_hCenter", :name => "match[hCenter]"
      assert_select "input#match_RW", :name => "match[RW]"
      assert_select "input#match_pRW", :name => "match[pRW]"
      assert_select "input#match_hRW", :name => "match[hRW]"
      assert_select "input#match_LW", :name => "match[LW]"
      assert_select "input#match_pLW", :name => "match[pLW]"
      assert_select "input#match_hLW", :name => "match[hLW]"
      assert_select "input#match_Def1", :name => "match[Def1]"
      assert_select "input#match_pDef1", :name => "match[pDef1]"
      assert_select "input#match_hDef1", :name => "match[hDef1]"
      assert_select "input#match_Def2", :name => "match[Def2]"
      assert_select "input#match_pDef", :name => "match[pDef]"
      assert_select "input#match_hDef", :name => "match[hDef]"
      assert_select "input#match_Goalie", :name => "match[Goalie]"
    end
  end
end
