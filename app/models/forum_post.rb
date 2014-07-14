# Reads forums rss feed
class ForumPost
  require 'rss'
  require 'open-uri'

  def self.topics
    RSS::Parser.parse(
      open(Rails.application.secrets.forum_rss_uri)
    )
  end
end
