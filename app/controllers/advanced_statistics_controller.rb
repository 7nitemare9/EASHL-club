# AdvancedStatistic controller
class AdvancedStatisticsController < ApplicationController
  def index
    respond_to do |format|
      format.html {render :html => "nothing"}
      format.json {render :json => AdvancedStatistic.stats}
    end
  end
end
