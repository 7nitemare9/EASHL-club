class AdvancedStatistic
  def self.corsi_team
    shots_for = 0
    shots_against = 0
    matches = Match.all_but_unplayed.compact
    matches.each do |i|
      i.game_players.each do |j|
        if j.team == Rails.application.secrets.team_id
          shots_for += j.skshots.to_i
        else
          shots_against += j.skshots.to_i
        end
      end
    end
    (shots_for / matches.count) - (shots_against / matches.count)
  end

  def self.corsi_relative_player(name)
    matches = Match.all_but_unplayed.compact
    with_shots_for = 0
    with_shots_against = 0
    without_shots_for = 0
    without_shots_against = 0
    games_with = 0
    games_without = 0
    matches.each do |match|
      if match.game_players.where(personaName:  name).empty?
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
    puts (with_shots_for - with_shots_against) / games_with
    puts (without_shots_for - without_shots_against) / games_without
    ((with_shots_for - with_shots_against) / games_with) - ((without_shots_for - without_shots_against) / games_without)
  end

end
