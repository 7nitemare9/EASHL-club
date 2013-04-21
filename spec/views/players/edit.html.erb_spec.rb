require 'spec_helper'

describe "players/edit" do
  before(:each) do
    @player = assign(:player, stub_model(Player,
      :name => "MyString",
      :matches => "",
      :goals => "",
      :assists => "",
      :points => "",
      :hits => ""
    ))
  end

  it "renders the edit player form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => players_path(@player), :method => "post" do
      assert_select "input#player_name", :name => "player[name]"
      assert_select "input#player_matches", :name => "player[matches]"
      assert_select "input#player_goals", :name => "player[goals]"
      assert_select "input#player_assists", :name => "player[assists]"
      assert_select "input#player_points", :name => "player[points]"
      assert_select "input#player_hits", :name => "player[hits]"
    end
  end
end
