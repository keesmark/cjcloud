class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include SessionsHelper

  
  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def admin_user
    if logged_in?
     redirect_to root_url unless current_user.admin_flag?
    end
  end
  
end
