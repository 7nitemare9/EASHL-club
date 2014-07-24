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
      Tweet.create!({messages: auth.home_timeline.to_json}).messages
    elsif (where(id: 1).first.updated_at + 61) < Time.now
      where(id: 1).first.update_attributes({messages: auth.home_timeline.to_json})
      where(id: 1).first.messages
    else
      where(id: 1).first.messages
    end
  end

end
