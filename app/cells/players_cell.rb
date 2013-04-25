class PlayersCell < Cell::Rails

  def online
    @players = Player.online
    render
  end

end
