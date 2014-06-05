class ForumPost
  require 'rss'
  require 'open-uri'

  def self.topics
    RSS::Parser.parse(open('http://www.bombers-hockey.com/forum/syndication.php'))
  end

end
