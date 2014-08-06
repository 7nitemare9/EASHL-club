# Shoutbox controller
class ShoutsController < ApplicationController
  def index
    respond_to do |format|
      format.html {render :html => @shouts = Shout.find_all}
      format.json {render :json => Shout.find_all}
    end
  end

  def create
    Shout.create(shout_params)
    #render :shout_save
  end

  def show
    respond_to do |format|
      format.json {render json: {user: @current_user.user_name}}
    end
  end

  def destroy
    @post = Shout.find(params[:id])
    redirect_to root_path if @post.destroy
  end

  def user
  end

  private

  def shout_params
    params.require(:shout).permit(:message, :name)
  end
end
