require_relative '../../app/models/forum_post'
require 'webmock'
require 'webmock/rspec'
require_relative '../support/fake_forum_rss'

describe ForumPost do
  WebMock.stub_request(:any, /bombers-hockey.com/).to_rack(FakeForumRss)

  it 'should return rss object of rss data' do
    ForumPost.topics.items[0].link.should  eq(
      "http://www.bombers-hockey.com/forum/viewtopic.php?f=4&t=5&p=12#p12"
    )
    

    
  end
end
