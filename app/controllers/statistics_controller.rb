# Stotistic contreller
class StatisticsController < ApplicationController
  def index
    @stats = Statistic.all_stats
  end
end
