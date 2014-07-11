# Media page controller
class MediasController < ApplicationController
  require 'auth_helper'
  include AuthHelper
  before_filter :is_admin, except: [:index, :show]

  def index
    @medias = Media.all.page(params[:page]).per(1)
  end

  def new
  end

  def create
    @media = Media.new(media_params)
    @media.save
    redirect_to root_path
  end

  def update
    @media = Media.find(params[:id])
    redirect_to root_path if @media.update_attributes(media_params)
  end

  def show
    @media = Media.find(params[:id])
  end

  def edit
    @media = Media.find(params[:id])
  end

  def destroy
    @media = Media.find(params[:id])
    redirect_to root_path if @media.destroy
  end

  private

  def media_params
    params.require(:media).permit(:title, :text)
  end
end
