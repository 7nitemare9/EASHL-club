# Reads in all players in club
class Player < ActiveRecord::Base
  has_one :player_team_stat
  has_one :player_season_stat
  require 'rubygems'
  require 'nokogiri'
  require 'open-uri'
  require 'json'
  require 'web_helpers'
  @team = ''

  def self.get_page(page, team)
    url = 'http://www.easports.com/iframe/nhl14proclubs/api/platforms/xbox/' \
          'clubs/' + team + '/' + page
    @team = team
    player_data WebHelpers.read_json(url)
  end

  def self.player_data(doc)
    add_members doc
    delete_members doc
  end

  def self.add_members(doc)
    read_players(doc).each do |player|
      add_to_database(player)
      add_player_team_stat(player)
      add_player_season_stat(player)
    end
  end

  def self.add_to_database(player)
    if find_by_name(player[:name])
      existing_player(player).update_attributes(player)
    else
      create!(player)
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
        list << { name: member[1]['name'], eaid: member[0] }
      end
    end
    list
  end

  def self.pos_num_to_pos(num)
    %w(G D D LW C RW)[num]
  end

  def self.existing_player(player)
    find_by_name(player[:name])
  end

  def self.add_player_team_stat(player)
    existing_player(player).create_player_team_stat(
      PlayerTeamStat.get_data(@team, player[:eaid])
    )
  end

  def self.add_player_season_stat(player)
    existing_player(player).create_player_season_stat(
      PlayerSeasonStat.get_data(player[:eaid])
    )
  end
end
