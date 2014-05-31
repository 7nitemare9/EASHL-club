class ShoutsController < ApplicationController

  def create
    Shout.create(params[:shout])
    render :shout_save
  end
  
  def show
  end

end
