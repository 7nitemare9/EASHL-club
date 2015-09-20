# Creates statistics
class Statistic
  def self.all_stats
    statistics = {}
    players = Player.all
    statistics[:points] = average('points', active(players))
    statistics[:goals] = average('goals', active(players))
    statistics[:assists] = average('assists', active(players))
    statistics[:pims] = average('pim', active(players)).reverse
    statistics[:team_players] = team_players(active(players))
    statistics[:defensive_players] = defensive_players(active(players))
    statistics[:goalies] = goalies(active_goalies(players))
    statistics
  end

  def self.average(statistic, players)
    players.sort_by do |player|
      stat(player)[('sk' + statistic).to_sym].to_i / stat(player)[:totalgp].to_f
    end.reverse
  end

  def self.team_players(players)
    players.sort_by do |player|
      team_player_value(stat(player))
    end.reverse
  end

  def self.defensive_players(players)
    players.sort_by do |player|
      defensive_player_value(stat(player))
    end.reverse
  end

  def self.goalies(players)
    players.sort_by do |player|
      goalie_value(stat(player))
    end.reverse
  end

  def self.team_player_value(k)
    (k[:skplusmin].to_i / k[:totalgp].to_f) +
    ((k[:skbs].to_i / k[:totalgp].to_f) * 10)
  end

  def self.defensive_player_value(k)
    ((k[:skplusmin].to_i *  2) +
    (k[:skbs].to_i * 5) +
    (k[:skhits].to_i * 0.1)) / k[:totalgp].to_f
  end

  def self.goalie_value(k)
    k[:glsavepct].to_f  *
      ((k[:glsoperiods].to_i + 1) / k[:glgp].to_f) /
      k[:glgaa].to_f
  end

  def self.active(players)
    active_players = []
    players.each do |player|
      next unless player.player_team_stat[:totalgp]
      active_players.push player
    end
    active_players
  end

  def self.active_goalies(players)
    active_goalies = []
    active(players).each do |player|
      next unless player.player_team_stat[:glgp].to_i > 0
      active_goalies << player
    end
    active_goalies
  end

  def self.stat(player)
    player.player_team_stat
  end

  def self.stats
    all_players = Match.all(:include => :game_players)
    {forwards: forward_stats(all_players), defenders: defender_stats(all_players),
      goalies: goalie_stats(all_players)}
  end

  def self.goalie_stats(all_players)
    goalies = all_but_empty(game_players(all_players, '0'))
    unique_player_names(goalies).map do |name|
      goalie = {name: name, goals_against: 0, saves: 0, GAA: 0,
        shots_against: 0, SO: 0, save_percent: 0, games: 0}
      goalies.each do |player|
        if name == player.first.personaName
          goalie[:goals_against] += player.first.glga.to_i
          goalie[:saves] += player.first.glsaves.to_i
          goalie[:shots_against] += player.first.glshots.to_i
          p player.first.glshots.to_i
          goalie[:SO] += 1 if (player.first.glga == '0')
          goalie[:games] += 1
        end
      end
      goalie[:save_percent] = (goalie[:saves] / goalie[:shots_against].to_f) * 100
      goalie[:GAA] = goalie[:goals_against] / goalie[:games].to_f
      goalie
    end
  end

  def self.forward_stats(all_players)
    forwrds = all_but_empty(forwards(all_players))
    unique_player_names(forwrds).map do |name|
      forward = {name: name, assists: 0, giveaways: 0, goals: 0,
                 hits: 0, pims: 0, plus_minus:  0, points: 0, shots: 0, takeaways: 0,
        shot_percent: 0, games: 0}
      forwrds.each do |player|
        if name == player.first.personaName
          forward = player_stats_adder(forward, player.first)
        end
      end
      forward[:shot_percent] = (forward[:goals] / forward[:shots].to_f) * 100
      forward
    end
  end

  def self.defender_stats(all_players)
    d = all_but_empty(defenders(all_players))
    unique_player_names(d).map do |name|
      defender = {name: name, assists: 0, giveaways: 0, goals: 0,
                 hits: 0, pims: 0, plus_minus: 0, points: 0, shots: 0, takeaways: 0,
                 shot_percent: 0, games: 0}
      d.each do |players|
        players.each do |player|
          if name == player.personaName
            defender = player_stats_adder(defender, player)
          end
        end
      end
      defender[:shot_percent] = (defender[:goals] / defender[:shots].to_f) * 100
      defender
    end
  end

  def self.player_stats_adder(forward, player)
    forward[:assists] += player.skassists.to_i
    forward[:giveaways] += player.skgiveaways.to_i
    forward[:goals] += player.skgoals.to_i
    forward[:hits] += player.skhits.to_i
    forward[:pims] += player.skpim.to_i
    forward[:plus_minus] += player.skplusmin.to_i
    forward[:points] += player.skpoints.to_i
    forward[:shots] += player.skshots.to_i
    forward[:takeaways] += player.sktakeaways.to_i
    forward[:games] += 1
    forward
  end

  def self.defenders(all_players)
    defenders = game_players(all_players, '1')
    # defenders += game_players(all_players, '2')
  end

  def self.forwards(all_players)
    forward = game_players(all_players, '3')
    forward += game_players(all_players, '4')
    forward += game_players(all_players, '5')
  end

  def self.game_players(players, position)
    players.map do |player|
      player.game_players.where(position: position).where(team: Rails.application.secrets.team_id)
    end
  end

  def self.unique_player_names(players)
    players.map do |p|
      p.map do |n|
        n.personaName
      end
    end.flatten.uniq
  end

  def self.all_but_empty(players)
    players.reject do |player|
      player.empty?
    end
  end
end
