class MatchesCell < Cell::Rails

  def recent
		@matches = Match.order('created_at DESC').limit(5).all
		render		
  end

end
