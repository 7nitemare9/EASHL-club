# Controller for forum view. Cerrently unused
class ForumController < ApplicationController
  def index
  end

  def show
    @forum = "http://bombers-hockey.com/bhf/" + params[:id] + "." + params[:format] + "?f=" + params[:f] + "&t=" + params[:t] + "&p=" + params[:p]
  end
end
