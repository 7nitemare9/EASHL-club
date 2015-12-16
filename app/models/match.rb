# Reads in matches
class Match < ActiveRecord::Base
  has_many :game_players
  has_many :game_teams
  require 'nokogiri'
  require 'open-uri'
  require 'web_helpers'

  @@players = {}

  def self.get_matches(num_matches)
    url = 'http://www.easports.com/iframe/nhl14proclubs/api/platforms/ps4/' \
      'clubs/' + Rails.application.secrets.team_id + '/matches' \
      '?filters=sum,pretty&match_type=gameType5&matches_returned=' + num_matches

    read_and_add_match_data WebHelpers.read_json(url)
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
    read_matches(hash_doc).map do |game|
      {
        match: { matchId: game[1]['matchId'].to_s,
                 timestamp: game[1]['timestamp'] },
        clubs: game[1]['clubs'],
        players: game[1]['players']
      }
    end
  end

  def self.read_matches(hash_doc)
    hash_doc['raw'].map { |key| key }
  end

  def self.create_team_hash(clubs)
    teams = []
    clubs.each do |team|
      p team[1]
      if team[1]['details']
        name = team[1]['details']['name'] || 'Deleted'
        club_id = team[1]['details']['clubId'] || 'Deleted'
      else
        name = 'Deleted'
        club_id = 'Deleted'
      end
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
    do_not_touch = %w(id match_id personaName team blazeId)
    hash = {}
    GamePlayer.attribute_names.each do |attr|
      hash[attr.to_sym] = player[1][attr] unless do_not_touch.include?(attr)
    end
    hash[:skpoints] = player[1]["skgoals"].to_i + player[1]["skassists"].to_i
    hash[:team] = team[0]
    hash[:blazeId] = player[0]
    if player[1]['details']
      hash[:personaName] = player[1]['details']['personaName']
    else
      hash[:personaName] = @@players[player[0]]['personaName']
    end
    @@players[player[0]] = {'personaName' => player[1]['details']['personaName']} if player[1]['details']
    hash
  end

  def self.all_but_unplayed
    all(:include => [:game_teams, :game_players]).map do |game|
      unless game.game_teams[0].goals and game.game_teams[0].goalsAgainst == "0" or (game.game_teams[0].clubId != Rails.application.secrets.team_id and game.game_teams[1].clubId != Rails.application.secrets.team_id)
        game
      end
    end
  end

  def self.previous(id)
    team = Match.find(id).game_teams.map { |club| club.clubId unless (club.clubId == Rails.application.secrets.team_id or club.name == "Bombers Hockey")}
    games = GameTeam.where(clubId: team.compact.first)
    Match.where(id: games.map { |i| i.match_id} - [id.to_i])
  end

end
