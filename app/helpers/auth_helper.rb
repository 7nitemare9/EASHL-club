# Authhelper
module AuthHelper
  def is_admin
    if @current_user
      redirect_to root_path unless @current_user.user_name == 'admin' or Rails.application.secrets.authorize == false
    else
      redirect_to root_path
    end
  end
end
