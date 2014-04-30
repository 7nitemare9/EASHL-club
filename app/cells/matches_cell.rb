class MatchesCell < Cell::Rails

  def recent
		@matches = Match.order('timestamp DESC').limit(5).all
		render		
  end

end
