# Reads in matches
class Match < ActiveRecord::Base
  has_many :game_players
  has_many :game_teams
  require 'nokogiri'
  require 'open-uri'
  require 'web_helpers'

  def self.get_matches(page, team, num_matches)
    url = 'http://www.easports.com/iframe/nhl14proclubs/api/platforms/xbox/' \
          'clubs/' + team + '/' + page + '?filters=sum,pretty&' \
          'matches_returned=' + num_matches
    read_and_add_match_data WebHelpers.read_json(url)
  end

  def self.pos(num)
    %w(Goalie Def Def LW Center RW)[num.to_i]
  end

  def self.read_and_add_match_data(doc)
    read_match_data(doc).each do |match|
      next if where(matchId: match[:match][:matchId]).first
      db_match = Match.new(match[:match])
      db_match.save!
      db_match.game_players.create!(create_player_hash(match[:players]))
      db_match.game_teams.create!(create_team_hash(match[:clubs]))
    end
  end

  def self.read_match_data(hash_doc)
    list = []
    read_matches(hash_doc).each do |game|
      list << {
        match: { matchId: game[1]['matchId'].to_s,
                 timestamp: game[1]['timestamp'] },
        clubs: game[1]['clubs'],
        players: game[1]['players']
      }
    end
    list
  end

  def self.read_matches(hash_doc)
    list = []
    hash_doc['raw'].each do |key|
      list << key
    end
    list
  end

  def self.create_team_hash(clubs)
    teams = []
    clubs.each do |team|
      name = team[1]['details']['name'] || 'Deleted'
      club_id = team[1]['details']['clubId'] || 'Deleted'
      teams << team_stats(team, name, club_id)
    end
    teams
  end

  def self.create_player_hash(players)
    members = []
    players.each do |team|
      team[1].each do |player|
        members << team_player(team, player)
      end
    end
    members
  end

  def self.team_stats(team, name, club_id)
    {
      memberstring: team[1]['memberstring'],
      score:        team[1]['score'],
      winnerByDnf:  team[1]['winnerByDnf'],
      goals:        team[1]['goals'],
      goalsAgainst: team[1]['goalsAgainst'],
      name:         name,
      clubId:       club_id
    }
  end

  def self.team_player(team, player)
    do_not_touch = %w(id match_id personaName, team, blazeId)
    hash = {}
    GamePlayer.attribute_names.each do |attr|
      hash[attr.to_sym] = player[1][attr] unless do_not_touch.include?(attr)
    end
    hash[:team] = team[0]
    hash[:blazeId] = player[0]
    hash[:personaName] = player[1]['details']['personaName']
    hash
  end
end
