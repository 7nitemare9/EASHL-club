class PlayersCell < Cell::Rails
  cache :online, :expires_in => 5.minutes
  def online
    @players = Player.online    
    render
  end
end
