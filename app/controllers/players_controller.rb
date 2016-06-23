# Players Controller
class PlayersController < ApplicationController
  require 'auth_helper'
  include AuthHelper

  skip_before_filter  :verify_authenticity_token
  before_filter :is_admin,
                except: [:index, :member_data, :online_status, :show]

  def index
    @players = Player.all
    respond_to do |format|
      format.html
      format.json {render :json => @players}
    end
  end

  def show
    @player = Player.find(params[:id])
  end

  def new
    @player = Player.new
  end

  # GET /players/1/edit
  def edit
    @player = Player.find(params[:id])
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to @player, notice: 'Player was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    @player = Player.find(params[:id])
    if @player.update_attributes(player_params)
      redirect_to @player, notice: 'Player was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    redirect_to players_url
  end

  def member_data
    @page = Player.members()
  end

  def online_status
    Online.online_status
  end

  def player_params
    params.require(:player).permit(:name, :RealName, :City, :number, :age,
                                   :position, :typ, :strength, :style)
  end
end
