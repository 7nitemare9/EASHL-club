# Latest matches
class MatchesCell < Cell::Rails
  def recent
    @matches = Match.order('timestamp DESC').limit(5).includes(:game_teams)
    render
  end
end
