require 'spec_helper'

describe Player do
   
  it 'gets the player info and stats for the club' do
    Player.get_page('members', '12345')
  end
end
