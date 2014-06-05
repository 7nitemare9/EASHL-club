class Statistic

  def self.get_all_stats
    statistics = {}
    players = Player.all
    statistics[:points] = get_points(active(players))
    statistics[:goals] = get_goals(active(players))
    statistics[:assists] = get_assists(active(players))
    statistics[:pims] = get_pims(active(players))
    statistics[:team_players] = get_team_players(active(players))
    statistics[:defensive_players] = get_defensive_players(active(players))
    statistics[:goalies] = get_goalies(active_goalies(players))
    statistics
  end

  def self.get_points(players)
    sorted = players.sort_by do |k| 
       ks = k.player_team_stat
       ks[:skpoints].to_i / ks[:totalgp].to_f
    end.reverse
  end

  def self.get_goals(players)
    sorted = players.sort_by do |k| 
      ks = k.player_team_stat
      ks[:skgoals].to_i / ks[:totalgp].to_f  
    end.reverse
  end

  def self.get_assists(players)
    sorted = players.sort_by do |k| 
      ks = k.player_team_stat
      ks[:skassists].to_i / ks[:totalgp].to_f  
    end.reverse
  end

  def self.get_pims(players)
    sorted = players.sort_by do |k| 
      ks = k.player_team_stat
      ks[:skassists].to_i / ks[:totalgp].to_f  
    end.reverse
  end

  def self.get_pims(players)
    sorted = players.sort_by do |k| 
      ks = k.player_team_stat
      ks[:skpim].to_i / ks[:totalgp].to_f 
    end
  end

  def self.get_team_players(players)
    sorted = players.sort_by do |k| 
      ks = k.player_team_stat
      team_player_value(ks) 
    end.reverse
  end
  
  def self.get_defensive_players(players)
    sorted = players.sort_by do |k| 
      ks = k.player_team_stat
      defensive_player_value(ks) 
    end.reverse
  end
  
  def self.get_goalies(players)
    sorted = players.sort_by do |k|
      ks = k.player_team_stat
      goalie_value(ks)
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
      if player.player_team_stat[:totalgp] 
        active_players.push player
      end
    end
    active_players
  end

  def self.active_goalies(players)
    active_goalies = []
    active(players).each do |player|
      if player.player_team_stat[:glgp].to_i > 0 
        active_goalies << player
      end
    end
    active_goalies
  end

end
