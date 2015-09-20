# Stotistic contreller
class StatisticsController < ApplicationController
  def index
    respond_to do |format|
      format.html {render :html => "nothing"}
      format.json {render :json => Statistic.stats}
    end
  end
end
