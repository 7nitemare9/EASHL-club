# Shoutbox controller
class ShoutsController < ApplicationController
  def index
    @shouts = Shout.find_all
    render layout: false
  end

  def create
    Shout.create(shout_params)
    render :shout_save
  end

  def show
  end

  def destroy
    @post = Shout.find(params[:id])
    redirect_to root_path if @post.destroy
  end

  private

  def shout_params
    params.require(:shout).permit(:message, :name)
  end
end
