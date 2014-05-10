class ApplicationController < ActionController::Base
  protect_from_forgery
  require 'phpbb_auth'
  include PhpbbAuth
  before_filter :set_current_user

  class NoUser < Struct.new(:user_name)
  end

  def set_current_user
    @current_user = current_user
    unless @current_user
      @current_user = NoUser.new
      @current_user.user_name = "not logged in"
    end
    @current_user    
  end
end
