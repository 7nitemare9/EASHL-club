class Match < ActiveRecord::Base
  has_many :game_players
  has_many :game_teams
  require 'nokogiri'
  require 'open-uri'
  require 'web_helpers'

  def self.get_matches(page, team)
    url = "http://www.easports.com/iframe/nhl14proclubs/api/platforms/xbox/clubs/" + team + "/" +page + "?filters=sum,pretty&matches_returned=500"
    read_and_add_match_data WebHelpers.read_json(url)
  end

  def self.pos(num)
          case num.to_i
          when 0
                  return 'Goalie'
          when 1
                  return 'Def'
          when 3
                  return 'LW'
          when 4
                  return 'Center'
          when 5
                  return 'RW'
          end
  end

  def self.read_and_add_match_data(doc)
    read_match_data(doc).each do |match|
      unless find_by matchId: match[:match][:matchId]
        db_match = Match.new(match[:match])
        db_match.save!
        db_match.game_players.create!(create_player_hash(match[:players]))
        db_match.game_teams.create!(create_team_hash(match[:clubs]))
      end
    end
  end
  
  def self.read_match_data(hash_doc)
    list = []
    read_matches(hash_doc).each do |game| 
      list << {
      match: { matchId: game[1]["matchId"].to_s, timestamp: game[1]["timestamp"]},
      clubs: game[1]["clubs"], 
      players: game[1]["players"] }
    end
    list
  end

  def self.read_matches(hash_doc)
    list = []
    hash_doc["raw"].each do |key|
      list << key
    end
    list
  end
  
  def self.create_team_hash(clubs)
    teams = []
    clubs.each do |team|
      if team[1]["details"] == nil then
        name = "Deleted"
        clubId = "Deleted"
      else
        name = team[1]["details"]["name"]
        clubId = team[1]["details"]["clubId"]
      end
      teams << {
      memberstring: team[1]["memberstring"],
      score:        team[1]["score"],
      winnerByDnf:  team[1]["winnerByDnf"],
      goals:        team[1]["goals"],
      goalsAgainst: team[1]["goalsAgainst"],
      name:         name,
      clubId:       clubId      }
    end
    teams
  end

  def self.create_player_hash(players)
    members = []
    players.each do |team|
        team[1].each do |player|
          members << {
            team:         team[0],
            blazeId:      player[0],
            glga:         player[1]["glga"],
            glsavepct:    player[1]["glsavepct"],
            glsaves:      player[1]["glsaves"],
            glshots:      player[1]["glshots"],
            position:     player[1]["position"],
            skassists:    player[1]["skassists"],
            skfow:        player[1]["skfow"],
            skgiveaways:  player[1]["skgiveaways"],
            skgoals:      player[1]["skgoals"],
            skhits:       player[1]["skhits"],
            skpim:        player[1]["skpim"],
            skplusmin:    player[1]["skplusmin"],
            skpoints:     player[1]["skpoints"],
            skshots:      player[1]["skshots"],
            sktakeaways:  player[1]["sktakeaways"],
            personaName:  player[1]["details"]["personaName"]
      }
      end
    end
    members
  end

end
