class PlayersCell < Cell::Rack
#  cache :online, :expires_in => 5.minutes
  def online
    @players = Online.status
    render
  end
end
