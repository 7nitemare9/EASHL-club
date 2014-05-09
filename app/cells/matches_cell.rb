class MatchesCell < Cell::Rails

  def recent
		@matches = Match.order('timestamp DESC').limit(5)
		render		
  end

end
