require 'spec_helper'

describe PlayerSeasonStat do

  it 'should read in player stat for whole season' do
    PlayerSeasonStat.get_data('12345').should include(skgoals: '258')
    PlayerSeasonStat.get_data('12345').should include(cgp: '273')
  end

end
