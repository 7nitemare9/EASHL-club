class StatisticsController < ApplicationController

  def index
    @stats = Statistic.get_all_stats
  end

end
