class TweetsController < ApplicationController

  def index
    respond_to do |format|
      format.json {render :json => Tweet.all_tweets}
    end
  end
end
