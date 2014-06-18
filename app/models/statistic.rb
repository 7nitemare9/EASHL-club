# Creates statistics
class Statistic
  def self.all_stats
    statistics = {}
    players = Player.all
    statistics[:points] = average('points', active(players))
    statistics[:goals] = average('goals', active(players))
    statistics[:assists] = average('assists', active(players))
    statistics[:pims] = average_low_first('pim', active(players))
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

  def self.average_low_first(statistic, players)
    players.sort_by do |player|
      stat(player)[('sk' + statistic).to_sym].to_i / stat(player)[:totalgp].to_f
    end
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
    ((k[:skplusmin].to_i / k[:totalgp].to_f) *  2) +
    ((k[:skbs].to_i / k[:totalgp].to_f) * 5) +
    ((k[:skhits].to_i / k[:totalgp].to_f) * 0.1)
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
end
