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

  def self.pdo_team(matches = Match.all_but_unplayed.compact)
    team = {shots_for: 0, shots_against: 0, goals_for: 0, goals_against: 0}
    matches.each do |match|
      match.game_players.each do |i|
        if i.team == Rails.application.secrets.team_id
          team[:shots_for] += i.skshots.to_i
        else
          team[:shots_against] += i.skshots.to_i
        end
      end
      team[:goals_for] += match.game_teams.where(clubId: Rails.application.secrets.team_id).first.goals.to_i
      team[:goals_against] += match.game_teams.where(clubId: Rails.application.secrets.team_id).first.goalsAgainst.to_i
    end
    puts team
    ((team[:goals_for] / team[:shots_for].to_f) + ((team[:shots_against] - team[:goals_against]) / team[:shots_against].to_f)) * 1000
  end

  def self.pdo_team_6
    pdo_team(six_matches)
  end

  def self.pdo_player(name, matches = Match.all_but_unplayed.compact)
    player = {shots_for: 0, shots_against: 0, goals_for: 0, goals_against: 0}
    matches.each do |match|
      if match.game_players.where(personaName: name).empty? or match.game_players.where(personaName: name).where(position: '0').empty? == false
        match.game_players.each do |i|
          if i.team == Rails.application.secrets.team_id
            player[:shots_for] += i.skshots.to_i
          else
            player[:shots_against] += i.skshots.to_i
          end
        end
        player[:goals_for] += match.game_teams.where(clubId: Rails.application.secrets.team_id).first.goals.to_i
        player[:goals_against] += match.game_teams.where(clubId: Rails.application.secrets.team_id).first.goalsAgainst.to_i
      end
    end
    ((player[:goals_for] / player[:shots_for].to_f) + ((player[:shots_against] - player[:goals_against]) / player[:shots_against].to_f)) * 1000
  end

  def self.pdo_player_6(name)
    pdo_player(name, six_matches)
  end

  def self.six_matches
    Match.all_but_unplayed.compact.map do |match|
      match if match.game_teams.first.memberstring == "6 / 6"
    end.compact
  end

end
