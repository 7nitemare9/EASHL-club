# Stotistic contreller
class StatisticsController < ApplicationController
  def index
    respond_to do |format|
      format.html {render :html => @stats = Statistic.all_stats}
      format.json {render :json => Statistic.stats}
    end
  end
end
