class MatchesController < ApplicationController
  # GET /matches
  # GET /matches.json
  def index
    @matches = Match.all
  end

  # GET /matches/1
  # GET /matches/1.json
  def show
    @match = Match.find(params[:id])
  end

  # GET /matches/new
  # GET /matches/new.json
  def new
    @match = Match.new
  end

  # GET /matches/1/edit
  def edit
    @match = Match.find(params[:id])
  end

  # POST /matches
  # POST /matches.json
  def create
    @match = Match.new(params[:match])
    if @match.save
      redirect_to @match, notice: 'Match was successfully created.' 
    else
      render action: "new" 
    end
  end

  # PUT /matches/1
  # PUT /matches/1.json
  def update
    @match = Match.find(params[:id])
    if @match.update_attributes(params[:match])
      redirect_to @match, notice: 'Match was successfully updated.' 
    else
      render action: "edit" 
    end
  end

  # DELETE /matches/1
  # DELETE /matches/1.json
  def destroy
    @match = Match.find(params[:id])
    @match.destroy
  end

  def getMatchData
    @page = Match.get_matches('matches', params[:team], params[:num_matches])
#		@page = Match.matchData(@page, params[:team])
    if @page.blank? then
      redirect_to :action => getMatchData, :team => params[:team]
    end
  end
end
