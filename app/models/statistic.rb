class Statistic

  def self.get_all_stats
    statistics = {}
    players = Player.all
    statistics[:points] = get_points(players)
    statistics[:goals] = get_goals(players)
    statistics[:assists] = get_assists(players)
    statistics[:pims] = get_pims(players)
    statistics[:team_players] = get_team_players(players)
    statistics[:defensive_players] = get_defensive_players(players)
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
      ks[:skassists].to_i / ks[:totalgp].to_i  
    end.reverse
  end

  def self.get_pims(players)
    sorted = players.sort_by do |k| 
      ks = k.player_team_stat
      ks[:skassists].to_i / ks[:totalgp].to_i  
    end.reverse
  end

  def self.get_pims(players)
    sorted = players.sort_by do |k| 
      ks = k.player_team_stat
      ks[:skpim].to_i / ks[:totalgp].to_i  
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
  
  def self.team_player_value(k)
    (k[:skplusmin].to_i / k[:totalgp].to_i) +
    ((k[:skbs].to_i / k[:totalgp].to_i) * 10)
  end

  def self.defensive_player_value(k)
    (k[:skplusmin].to_i / k[:totalgp].to_i) +
    ((k[:skbs].to_i / k[:totalgp].to_i) * 10) +
    ((k[:skhits].to_i / k[:totalgp].to_i) * 0.2)
  end

end
