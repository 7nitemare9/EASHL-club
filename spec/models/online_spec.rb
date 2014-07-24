require 'spec_helper'

describe Online do

  context 'no member exist in database' do
    before :each do
      Online.delete_all
    end

    it 'is returning status offline' do
      Player.should_receive(:all).and_return([{ name: 'iZHiTNiK' }])
      Online.should_receive(:create!).with(hash_including(status: 'Offline'))
      Online.online_status
    end

    it 'is returning status online' do
      Player.should_receive(:all).and_return([{ name: 'Jonbacken' }])
      Online.should_receive(:create!).with(hash_including(status: 'Online'))
      Online.online_status
    end
  end

  context 'member exist in database' do

    it 'is returning status offline' do
      @member = Online.create!(name: 'iZHiTNiK')
      Online.should_receive(:find_by_name).with('iZHiTNiK').at_least(1).and_return(@member)
      Player.should_receive(:all).and_return([{ name: 'iZHiTNiK' }])
      @member.should_receive(:update_attributes).at_least(1)
      Online.online_status
    end

    it 'is returning status online' do
      @member = Online.create!(name: 'Jonbacken')
      Online.should_receive(:find_by_name).with('Jonbacken').at_least(1).and_return(@member)
      Player.should_receive(:all).and_return([{ name: 'Jonbacken' }])
      @member.should_receive(:update_attributes).at_least(1)
      Online.online_status
    end
  end

  it 'creates online hash' do
    @result = { text: 'Spelar NHL', 
                name: 'name',  
                image: 'https://avatar-ssl.xboxlive.com/' \
               'avatar/name/avatarpic-l.png',
               status: 'Online' }
    @doc = 'test'
    @doc.should_receive(:at_css).and_return(@doc)
    @doc.should_receive(:text).and_return('Spelar NHL')
    Online.read_status(@doc, 'name').should eq @result
  end

  it 'creates online hash' do
    @result = { text: 'så senast', 
                name: 'name',  
                image: 'https://avatar-ssl.xboxlive.com/' \
               'avatar/name/avatarpic-l.png',
               status: 'Offline' }
    @doc = 'test'
    @doc.should_receive(:at_css).and_return(@doc)
    @doc.should_receive(:text).and_return('så senast')
    Online.read_status(@doc, 'name').should eq @result
  end

  it 'returns array of players' do
    Online.delete_all
    Player.create!(name: 'test')
    Online.create!(name: 'test')
    Player.create!(name: 'test2')
    Online.create!(name: 'test2')
    @result = Online.all
    Online.status.should eq @result
  end
end
