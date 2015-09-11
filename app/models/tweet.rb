class Tweet < ActiveRecord::Base

  def self.auth
    Twitter::REST::Client.new do |config|
      config.consumer_key = Rails.application.secrets.twitter_consumer_key
      config.consumer_secret = Rails.application.secrets.twitter_consumer_secret
      config.access_token = Rails.application.secrets.twitter_access_token
      config.access_token_secret = Rails.application.secrets.twitter_access_token_secret
    end
  end

  def self.all_tweets
    if where(id: 1).first == nil
      Tweet.create!({messages: auth.home_timeline.take(5).to_json}).messages
    elsif (where(id: 1).first.updated_at + 120).to_time < Time.now
      tweets = auth.home_timeline.take(5)
      p "old"
      unless tweets.first.respond_to?('status')
        p "update"
        where(id: 1).first.update_attributes({messages: tweets.to_json})
      end
      where(id: 1).first.messages
    else
      where(id: 1).first.messages
    end
  end

  def self.post_tweet(message, post_id)
    auth.update(message + " " + "http://bombers-hockey.com/posts/" + post_id.to_s)
  end



end
