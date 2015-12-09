class AdvancedStatistic
  def self.corsi_team(matches = Match.all_but_unplayed.compact)
    shots_for = 0
    shots_against = 0
    matches.each do |i|
      i.game_players.each do |j|
        if j.team == Rails.application.secrets.team_id
          shots_for += j.skshots.to_i
        else
          shots_against += j.skshots.to_i
        end
      end
    end
    shots_for / (shots_for + shots_against).to_f
  end

  def self.corsi_team_6
    corsi_team(six_matches)
  end

  def self.corsi_relative_player(name, matches = Match.all_but_unplayed.compact)
    with_shots_for = 0
    with_shots_against = 0
    without_shots_for = 0
    without_shots_against = 0
    games_with = 0
    games_without = 0
    matches.each do |match|
      puts match.game_players.where(personaName: name).where(position: '0').empty?
      if match.game_players.where(personaName:  name).empty? or match.game_players.where(personaName: name).where(position: '0').empty? == false
        games_without += 1
        match.game_players.each do |i|
          if i.team == Rails.application.secrets.team_id
            without_shots_for += i.skshots.to_i
          else
            without_shots_against += i.skshots.to_i
          end
        end
      else
        games_with += 1
        match.game_players.each do |i|
          if i.team == Rails.application.secrets.team_id
            with_shots_for += i.skshots.to_i
          else
            with_shots_against += i.skshots.to_i
          end
        end
      end
    end
    puts (with_shots_for / (with_shots_for + with_shots_against).to_f) * 100
    puts (without_shots_for / (without_shots_for + without_shots_against).to_f) * 100
    ((with_shots_for / (with_shots_for + with_shots_against).to_f) - (without_shots_for / (without_shots_for + without_shots_against).to_f))*100
  end

  def self.corsi_rel_player_6(name)
    corsi_relative_player(name, six_matches)
  end

  def self.pdo_team(matches = Match.all_but_unplayed.compact, six = false)
    team = {shots_for: 0, shots_against: 0, goals_for: 0, goals_against: 0}
    matches.each do |match|
      match.game_players.each do |i|
        if i.team == Rails.application.secrets.team_id
          team[:shots_for] += i.skshots.to_i
        else
          team[:shots_against] += i.skshots.to_i unless six
        end
      end
      team[:goals_for] += match.game_teams.where(clubId: Rails.application.secrets.team_id).first.goals.to_i
      team[:goals_against] += match.game_teams.where(clubId: Rails.application.secrets.team_id).first.goalsAgainst.to_i
      team[:shots_against] += match.game_players.where(team: Rails.application.secrets.team_id).where(position: '0').first.glshots.to_i unless six == false
    end
    puts team
    ((team[:goals_for] / team[:shots_for].to_f) + ((team[:shots_against] - team[:goals_against]) / team[:shots_against].to_f)) * 1000
  end

  def self.pdo_team_6
    pdo_team(six_matches)
  end

  def self.pdo_player(name, matches = Match.all_but_unplayed.compact, six = false)
    player = {shots_for: 0, shots_against: 0, goals_for: 0, goals_against: 0}
    matches.each do |match|
      if match.game_players.where(personaName: name).empty? == false and match.game_players.where(personaName: name).where(position: '0').empty? == true
        match.game_players.each do |i|
          if i.team == Rails.application.secrets.team_id
            player[:shots_for] += i.skshots.to_i
          else
            player[:shots_against] += i.skshots.to_i unless six
          end
        end
        player[:goals_for] += match.game_teams.where(clubId: Rails.application.secrets.team_id).first.goals.to_i
        player[:goals_against] += match.game_teams.where(clubId: Rails.application.secrets.team_id).first.goalsAgainst.to_i
        player[:shots_against] += match.game_players.where(team: Rails.application.secrets.team_id).where(position: '0').first.glshots.to_i unless six == false
      end
    end
    ((player[:goals_for] / player[:shots_for].to_f) + ((player[:shots_against] - player[:goals_against]) / player[:shots_against].to_f)) * 1000
  end

  def self.pdo_player_6(name)
    pdo_player(name, six_matches, true)
  end

  def self.six_matches(matches = Match.all_but_unplayed.compact)
    matches.map do |match|
      match if match.game_teams.first.memberstring == "6 / 6"
    end.compact
  end

  def self.stats
    matches = Match.all_but_unplayed.compact
    if Statistic.where(id: 2).first == nil
      #using forwards cell of statistics to store advanced stats
      Statistic.create!({forwards: {team: team_stats(matches), players: player_stats(matches)}.to_json, games_played: matches.count})
      return_cached_adv_stats
    elsif Statistic.where(id: 2).first.games_played == nil or Statistic.where(id: 2).first.games_played < matches.count
      Statistic.where(id: 2).first.update_attributes({forwards: {team: team_stats(matches), players: player_stats(matches)}.to_json, games_played: matches.count})
      return_cached_adv_stats
    else
      return_cached_adv_stats
    end
  end

  def self.return_cached_adv_stats
    JSON.parse(Statistic.where(id: 2).first.forwards)
  end

  def self.team_stats(matches)
    {team_c: corsi_team(matches), team_c6: corsi_team(six_matches(matches)), team_pdo: pdo_team(matches), team_pdo6: pdo_team(six_matches(matches), true)}
  end

  def self.player_stats(matches)
    players = {}
    Statistic.unique_player_names(Statistic.all_but_empty(skaters(matches))).each do |player|
      players[player] = {cr: corsi_relative_player(player, matches), cr6: corsi_relative_player(player, six_matches(matches)), pdo: pdo_player(player, matches), pdo6: pdo_player(player, six_matches(matches),true)}
    end
    players
  end

  def self.skaters(matches = Match.all_but_unplayed.compact)
    skaters = Statistic.game_players(matches, '1')
    skaters += Statistic.game_players(matches, '3')
    skaters += Statistic.game_players(matches, '4')
    skaters += Statistic.game_players(matches, '5')
  end

end
