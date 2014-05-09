class PlayersCell < Cell::Rails
#  cache :online, :expires_in => 5.minutes
  def online
    @players = Online.status
    render
  end
end
