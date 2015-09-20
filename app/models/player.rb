# Reads in all players in club
class Player < ActiveRecord::Base
  has_one :player_team_stat
  has_one :player_season_stat
  require 'rubygems'
  require 'nokogiri'
  require 'open-uri'
  require 'json'
  require 'web_helpers'

  def self.members()
    url = 'http://www.easports.com/iframe/nhl14proclubs/api/platforms/ps4/' \
      'clubs/' + Rails.application.secrets.team_id + '/members'
    player_data WebHelpers.read_json(url)
  end

  def self.player_data(doc)
    add_members doc
    # Disabled automatic deletion of non members.
    # delete_members doc
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
      found = nil
      read_players(doc).each do |player|
        found = true if player[:name] == dbplayer[:name]
      end
      find_by_name(dbplayer[:name]).destroy unless found
    end
  end

  def self.read_players(doc)
    doc['raw'].map do |key|
      key.map do |member|
        { name: member[1]['name'], eaid: member[0] }
      end
    end.flatten
  end

  def self.pos_num_to_pos(num)
    %w(G D D LW C RW)[num.to_i]
  end

  def self.existing_player(player)
    find_by_name(player[:name])
  end

  def self.add_player_team_stat(player)
    existing_player(player).create_player_team_stat(
      PlayerTeamStat.get_data(Rails.application.secrets.team_id, player[:eaid])
    )
  end

  def self.add_player_season_stat(player)
    existing_player(player).create_player_season_stat(
      PlayerSeasonStat.get_data(player[:eaid])
    )
  end
end
