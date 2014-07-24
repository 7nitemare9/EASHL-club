# Player Online status
class PlayersCell < Cell::Rack
  def online
    @players = Online.status
    render
  end
end
