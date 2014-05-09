class ApplicationController < ActionController::Base
  protect_from_forgery
  require 'phpbb_auth'
  include PhpbbAuth
  before_filter :set_current_user

  def set_current_user
    @current_user = current_user
  end
end
