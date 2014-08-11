class InfosController < ApplicationController
  require 'auth_helper'
  include AuthHelper
  before_filter :is_admin, except: [:index, :show]

  def index
    @infos = Info.order('id DESC').page(params[:page]).per(1)
  end

  def new
  end

  def create
    @info = Info.new(media_params)
    @info.save
    redirect_to root_path
  end

  def update
    @info = Info.find(params[:id])
    redirect_to root_path if @info.update_attributes(media_params)
  end

  def show
    @info = Info.find(params[:id])
  end

  def edit
    @info = Info.find(params[:id])
  end

  def destroy
    @info = Info.find(params[:id])
    redirect_to root_path if @info.destroy
  end

  private

  def media_params
    params.require(:info).permit(:title, :text)
  end
end

