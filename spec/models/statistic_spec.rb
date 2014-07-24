require 'spec_helper'

describe Statistic do

  let(:highest) do
    OpenStruct.new(
      player_team_stat: {
        playername: 'Highest', totalgp: '10', skgoals: '3', skassists: '3',
        skplusmin: '3', skpoints: '3', skpim: '3', skhits: '3', skbs: '3',
        skshotpct: '30.0', glgaa: '1.00', glsavepct: '90', glso: '5',
        glsoperiods: '20', glwins: '9', glgp: '10'
      }
    )
  end

  let(:middle) do
    OpenStruct.new(
      player_team_stat: {
        playername: 'Middle', totalgp: '10', skgoals: '1', skassists: '1',
        skplusmin: '0', skpoints: '1', skpim: '1', skhits: '1', skbs: '1',
        skshotpct: '10.0', glgaa: '3.00', glsavepct: '80', glso: '2',
        glsoperiods: '10', glwins: '5', glgp: '10'
      }
    )
  end

  let(:lowest) do
    OpenStruct.new(
      player_team_stat: {
        playername: 'Lowest', totalgp: '10', skgoals: '0', skassists: '0',
        skplusmin: '-3', skpoints: '0', skpim: '0', skhits: '0', skbs: '0',
        skshotpct: '0.0', glgaa: '5.00', glsavepct: '50', glso: '0',
        glsoperiods: '0', glwins: '0', glgp: '10'
      }
    )
  end

  let(:hash) { [middle, lowest, highest] }

  it 'loads all players' do
    Player.should_receive(:all).and_return(hash)
    Statistic.all_stats
  end

  it 'gets and sorts points' do
    Statistic.average('points', hash)[0].player_team_stat[:playername]
    .should eq 'Highest'
    Statistic.average('points', hash)[1].player_team_stat[:playername]
    .should eq 'Middle'
    Statistic.average('points', hash)[2].player_team_stat[:playername]
    .should eq 'Lowest'
  end

  it 'gets and sorts goals' do
    Statistic.average('goals', hash)[0].player_team_stat[:playername]
    .should eq 'Highest'
    Statistic.average('goals', hash)[1].player_team_stat[:playername]
    .should eq 'Middle'
    Statistic.average('goals', hash)[2].player_team_stat[:playername]
    .should eq 'Lowest'
  end

  it 'gets and sorts assists' do
    Statistic.average('assists', hash)[0].player_team_stat[:playername]
    .should eq 'Highest'
    Statistic.average('assists', hash)[1].player_team_stat[:playername]
    .should eq 'Middle'
    Statistic.average('assists', hash)[2].player_team_stat[:playername]
    .should eq 'Lowest'
  end

  it 'gets and sorts pims' do
    Statistic.average('pim', hash).reverse[0].player_team_stat[:playername]
    .should eq 'Lowest'
    Statistic.average('pim', hash).reverse[1].player_team_stat[:playername]
    .should eq 'Middle'
    Statistic.average('pim', hash).reverse[2].player_team_stat[:playername]
    .should eq 'Highest'
  end

  it 'gets and sorts team-players' do
    Statistic.team_players(hash)[0].player_team_stat[:playername]
    .should eq 'Highest'
    Statistic.team_players(hash)[1].player_team_stat[:playername]
    .should eq 'Middle'
    Statistic.team_players(hash)[2].player_team_stat[:playername]
    .should eq 'Lowest'
  end

  it 'gets and sorts defensive-players' do
    Statistic.defensive_players(hash)[0].player_team_stat[:playername]
    .should eq 'Highest'
    Statistic.defensive_players(hash)[1].player_team_stat[:playername]
    .should eq 'Middle'
    Statistic.defensive_players(hash)[2].player_team_stat[:playername]
    .should eq 'Lowest'
  end

  it 'gets and sorts goalies' do
    Statistic.goalies(hash)[0].player_team_stat[:playername]
    .should eq 'Highest'
    Statistic.goalies(hash)[1].player_team_stat[:playername]
    .should eq 'Middle'
    Statistic.goalies(hash)[2].player_team_stat[:playername]
    .should eq 'Lowest'
  end

end
