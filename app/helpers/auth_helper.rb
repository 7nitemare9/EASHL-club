module AuthHelper

  def is_admin
    if @current_user
      unless @current_user.user_name == "admin"  
        redirect_to root_path
      end
    else
      redirect_to root_path
    end 
  end

end
