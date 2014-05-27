require 'spec_helper'

describe Statistic do

let(:highest) { { :player_team_stat => {
               :playername => "Highest", :totalgp => "10", :skgoals => "3", :skassists => "3", :skplusmin => "3",
               :skpoints => "3", :skpim => "3", :skhits => "3", :skbs => "3", :skshotpct => "30.0",
               :glgaa => "1.00", :glsavepct => "90", :glso => "5", :glsoperiods => "20", :glwins => "9", :glgp => "10" 
              } } }
let(:middle) { { :player_team_stat => {
               :playername => "Middle", :totalgp => "10", :skgoals => "1", :skassists => "1", :skplusmin => "0",
               :skpoints => "1", :skpim => "1", :skhits => "1", :skbs => "1", :skshotpct => "10.0",
               :glgaa => "3.00", :glsavepct => "80", :glso => "2", :glsoperiods => "10", :glwins => "5", :glgp => "10" 
             } } }
let(:lowest){ { :player_team_stat => { 
              :playername => "Lowest", :totalgp => "10", :skgoals => "0", :skassists => "0", :skplusmin => "-3",
              :skpoints => "0", :skpim => "0", :skhits => "0", :skbs => "0", :skshotpct => "0.0",
              :glgaa => "5.00", :glsavepct => "50", :glso => "0", :glsoperiods => "0", :glwins => "0", :glgp => "10" 
            } } }
let(:hash) { [middle, lowest, highest] }

  it 'loads all players' do
    Player.should_receive(:all).and_return(hash)
    Statistic.should_receive(:get_points).with(hash)
    Statistic.should_receive(:get_goals).with(hash)
    Statistic.should_receive(:get_assists).with(hash)
    Statistic.should_receive(:get_pims).with(hash)
    Statistic.should_receive(:get_team_players).with(hash)
    Statistic.should_receive(:get_defensive_players).with(hash)
    Statistic.get_all_stats
  end

  it 'gets and sorts points' do
    Statistic.get_points(hash)[0][:playername].should eq "Highest"
    Statistic.get_points(hash)[1][:playername].should eq "Middle"
    Statistic.get_points(hash)[2][:playername].should eq "Lowest"
  end

  it 'gets and sorts goals' do
    Statistic.get_goals(hash)[0][:playername].should eq "Highest"
    Statistic.get_goals(hash)[1][:playername].should eq "Middle"
    Statistic.get_goals(hash)[2][:playername].should eq "Lowest"
  end

  it 'gets and sorts assists' do
    Statistic.get_assists(hash)[0][:playername].should eq "Highest"
    Statistic.get_assists(hash)[1][:playername].should eq "Middle"
    Statistic.get_assists(hash)[2][:playername].should eq "Lowest"
  end

  it 'gets and sorts pims' do
    Statistic.get_pims(hash)[0][:playername].should eq "Lowest"
    Statistic.get_pims(hash)[1][:playername].should eq "Middle"
    Statistic.get_pims(hash)[2][:playername].should eq "Highest"
  end

  it 'gets and sorts team-players' do
    Statistic.get_team_players(hash)[0][:playername].should eq "Highest"
    Statistic.get_team_players(hash)[1][:playername].should eq "Middle"
    Statistic.get_team_players(hash)[2][:playername].should eq "Lowest"
  end

  it 'gets and sorts defensive-players' do
    Statistic.get_defensive_players(hash)[0][:playername].should eq "Highest"
    Statistic.get_defensive_players(hash)[1][:playername].should eq "Middle"
    Statistic.get_defensive_players(hash)[2][:playername].should eq "Lowest"
  end

end
