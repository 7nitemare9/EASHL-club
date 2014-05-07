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
      find_by_name(dbplayer[:name]).destroy if found == 0 
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
