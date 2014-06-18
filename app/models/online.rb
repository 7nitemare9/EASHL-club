# Checks and stores online status of team members
class Online < ActiveRecord::Base
  require 'nokogiri'
  require 'open-uri'

  def self.online_status
    Player.all.each do |db_player|
      url = 'https://live.xbox.com/sv-SE/Profile?' \
            'Gamertag=' + CGI.escape(db_player[:name])
      member = read_status(WebHelpers.read_url(url), db_player[:name])
      if find_by_name(member[:name])
        find_by_name(member[:name]).update_attributes(member)
      else
        create!(member)
      end
    end
  end

  def self.read_status(doc, name)
    status = doc.at_css('.presence').text
    member = { text: status,
               name: name,
               image: 'https://avatar-ssl.xboxlive.com/' \
               'avatar/' + name + '/avatarpic-l.png',
               status: 'Online' }
    if status.include?('offline') || status.include?('senast')
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
