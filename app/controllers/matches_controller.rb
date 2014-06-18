# Matches Controller
class MatchesController < ApplicationController
  def index
    @matches = Match.all
  end

  def show
    @match = Match.find(params[:id])
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
    @page = Match.get_matches('matches', params[:team], params[:num_matches])
  end
end
