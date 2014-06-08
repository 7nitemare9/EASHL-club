require 'spec_helper'

describe Online do

  it 'is returning status offline' do
    Player.should_receive(:all).and_return([{ name: 'iZHiTNiK' }])
    Online.should_receive(:create!).with(hash_including(status: 'Offline'))
    Online.get_online_status
  end

  it 'is returning status online' do
    Player.should_receive(:all).and_return([{ name: 'Jonbacken' }])
    Online.should_receive(:create!).with(hash_including(status: 'Online'))
    Online.get_online_status
  end
end
