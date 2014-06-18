# Media page controller
class MediasController < ApplicationController
  def index
    @medias = Media.all.reverse
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
    redirect_to root_path if @media.update_attributes(params[:media])
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
