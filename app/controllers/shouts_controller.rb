class ShoutsController < ApplicationController

  def index
    @shouts = Shout.find_all
    render layout: false
  end

  def create
    Shout.create(params[:shout])
    render :shout_save
  end
  
  def show
  end
  
  def destroy
    @post = Shout.find(params[:id])
    if @post.destroy
      redirect_to root_path
    end
  end

end
