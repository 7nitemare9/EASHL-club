# Matches Controller
class MatchesController < ApplicationController
  def index
    @matches = Match.order('timestamp DESC').includes(:game_teams).page(params[:page]).per(15)
    @all_info= Match.order('timestamp Desc').includes(:game_teams, :game_players)
    respond_to do |format|
      format.html
      format.json {render :json => @all_info.to_json({:include => [:game_teams, :game_players]}) }
    end
  end
  def show
    @match = Match.find(params[:id])
    @previous = Match.previous(params[:id])
  end

  def new
    @match = Match.new
  end

  def edit
    @match = Match.find(params[:id])
  end

  def create
    @match = Match.new(params[:match])
    if @match.save
      redirect_to @match, notice: 'Match was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    @match = Match.find(params[:id])
    if @match.update_attributes(params[:match])
      redirect_to @match, notice: 'Match was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @match = Match.find(params[:id])
    @match.destroy
  end

  def match_data
    @page = Match.get_matches(params[:num_matches] || '10')
  end
end
