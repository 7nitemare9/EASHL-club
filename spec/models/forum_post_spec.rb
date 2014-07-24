require 'spec_helper'
require 'webmock'

describe ForumPost do

  it 'should return rss object of rss data' do
    ForumPost.topics.items[0].link.should eq(
      'http://www.bombers-hockey.com/forum/viewtopic.php?f=4&t=5&p=12#p12'
    )
  end
end
