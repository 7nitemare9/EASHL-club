require 'spec_helper'

describe Player do

  it 'gets the player info and stats for the club' do
    Player.should_receive(:player_data)
    Player.get_page('members', '12345')
  end

  it 'return right position from numbers' do
    Player.pos_num_to_pos(0).should eq 'G'
    Player.pos_num_to_pos(4).should eq 'C'
  end
end
