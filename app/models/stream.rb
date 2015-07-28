class Stream < ActiveRecord::Base
  def self.streams
    twitch = Twitch.new
    Stream.all.map do |stream|
      twitch.stream(stream.name)[:body]["stream"]
    end
  end
end
