require 'spec_helper'

describe Player do
  let (:read_player_doc) do
    { 'raw' => [{ '1234' => { 'name' => 'test' }}, { '2345' => { 'name' => 'test2'}}]}
  end
  let (:read_player) { [{ name: 'test', eaid: '1234' }, { name: 'test2', eaid: '2345' }] }

  it 'gets the player info and stats for the club' do
    Player.should_receive(:player_data)
    Player.get_page('members', '12345')
  end

  it 'should add new members and data and remove non members' do
    Player.should_receive(:add_members)
    Player.should_receive(:delete_members)
    Player.player_data('doc')
  end

  it 'reads out player data' do
    Player.read_players(read_player_doc).should eq read_player
  end

  it 'adds player, and stats' do
    Player.should_receive(:add_to_database).at_least(2).times
    Player.should_receive(:add_player_team_stat).at_least(2).times
    Player.should_receive(:add_player_season_stat).at_least(2).times
    Player.add_members(read_player_doc)
  end

  it 'should delete not current members' do
    Player.create!(name: 'test')
    Player.create!(name: 'destroy')
    expect {
      Player.delete_members(read_player_doc)
    }.to change(Player,:count).by(-1)
  end

  it 'should not delete current members' do
    Player.create!(name: 'test')
    expect {
      Player.delete_members(read_player_doc)
    }.to_not change(Player,:count)
  end

  it 'updates existing members attributes' do
    @test = Player.create!(name: 'test')
    Player.stub(:find_by_name).and_return(@test)
    @test.should_receive(:update_attributes)
    Player.add_to_database({ name: 'test' })
  end

  it 'creates player if it doesnt exist' do
    Player.should_receive(:create!)
    Player.add_to_database({ name: 'test' })
  end

  it 'returns existing member' do
    @test = Player.create(name: 'test')
    Player.existing_player({ name: 'test' }).should eq @test
  end

  it 'return right position from numbers' do
    Player.pos_num_to_pos(0).should eq 'G'
    Player.pos_num_to_pos(4).should eq 'C'
  end
end
