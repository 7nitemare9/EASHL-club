class Online < ActiveRecord::Base

require 'nokogiri'
require 'open-uri'

  def self.get_online_status
    Player.all.each do |db_player|
      url = 'https://live.xbox.com/sv-SE/Profile?Gamertag=' + CGI.escape(db_player[:name])
      doc = WebHelpers.read_url(url)
      member = read_status(doc, db_player[:name])
      unless find_by_name(member[:name]) 
        create!(member)
      else
        find_by_name(member[:name]).update_attributes(member)
      end
    end
  end

  def self.read_status(doc, name)
    status = doc.at_css(".presence").text
    member = {:text => status, 
              :name => name,
              :image => "https://avatar-ssl.xboxlive.com/avatar/" + name + "/avatarpic-l.png",
              :status => "Online" }
    if status.include? 'offline' or status.include? 'senast' 
      member[:status] = 'Offline'
    end
    member
  end

  def self.status
    list = []
    Player.all.each do |player|
      list << find_by_name(player[:name])
    end
    list
  end

end
