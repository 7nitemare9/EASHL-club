require 'spec_helper'

describe PlayerTeamStat do

  it 'should read in player stat in current team' do
    PlayerTeamStat.get_data('54321', '12345').should include(:skgoals => "153") && include(:glgp => "0")
  end

end
