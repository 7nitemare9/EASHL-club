class Player < ActiveRecord::Base
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'json'
require 'web_helpers'

  def self.get_page(page, team)
    url = "http://www.easports.com/iframe/nhl14proclubs/api/platforms/xbox/clubs/" + team + "/" +page
    player_data WebHelpers.read_url(url)
  end

	def self.player_data(doc)
    add_members WebHelpers.parse_ea_json(doc)
    delete_members WebHelpers.parse_ea_json(doc)
  end

  def self.add_members(doc)
    read_players(doc).each do |player| 
      add_to_database(player)
    end
  end

  def self.add_to_database(player)
    unless find_by_name(player[:name]) then
      create!(player)
    else
      find_by_name(player[:name]).update_attributes(player)
    end
  end

  def self.delete_members(doc)
    all.each do |dbplayer|
      found = 0
      read_players(doc).each do |player|
        found = 1 if player[:name] == dbplayer[:name]
      end
      find_by_name[dbplayer[:name]].destroy if found == 0 
    end
  end

  def self.read_players(doc)
    list = []
    doc['raw'].each do |key|
      key.each do |member|
        list << {name: member[1]["name"], eaid: key}
      end
    end
    return list
  end

	def self.online
		list = []
	 	all.each do |db_player|
			url = 'https://live.xbox.com/sv-SE/Profile?Gamertag=' + CGI.escape(db_player[:name])
      doc = WebHelpers.read_url(url)
      member = get_online_status(doc, db_player[:name])
      member[:image] = "https://avatar-ssl.xboxlive.com/avatar/" + db_player[:name] + "/avatarpic-l.png"
			list.push(member)
		end
		return list
	end

  def self.get_online_status(doc, name)
    member = {}
    status = doc.at_css(".presence").text
    if status.include? 'offline' or status.include? 'senast' then
      member[:status] = 'Offline'
    else
      member[:status] = 'Online'
    end
    member[:text] = status
    member[:name] = name
    return member
  end

end
