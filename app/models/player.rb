class Player < ActiveRecord::Base
  has_one :player_team_stat
  require 'rubygems'
  require 'nokogiri'
  require 'open-uri'
  require 'json'
  require 'web_helpers'
  @@team = ''

  def self.get_page(page, team)
    url = "http://www.easports.com/iframe/nhl14proclubs/api/platforms/xbox/clubs/" + team + "/" +page
    @@team = team
    player_data WebHelpers.read_json(url)
  end

  def self.player_data(doc)
    add_members doc #WebHelpers.parse_ea_json(doc)
    delete_members doc #WebHelpers.parse_ea_json(doc)
  end

  def self.add_members(doc)
    read_players(doc).each do |player| 
      db_player = find_by_name(player[:name])#add_to_database(player)
      p player[:name] + " " + player[:eaid]
      db_player.create_player_team_stat(
        PlayerTeamStat.get_data(@@team, player[:eaid])
      )
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
      find_by_name(dbplayer[:name]).destroy if found == 0 
    end
  end

  def self.read_players(doc)
    list = []
    doc['raw'].each do |key|
      key.each do |member|
        list << {name: member[1]["name"], eaid: member[0]}
      end
    end
    return list
  end

  def self.pos_num_to_pos(num)
    case num
    when "1"
      "D"
    when "2"
      "D"
    when "3"
      "LW"
    when "4"
      "C"
    when "5"
      "RW"
    when "0"
      "G"
    end
  end

end
