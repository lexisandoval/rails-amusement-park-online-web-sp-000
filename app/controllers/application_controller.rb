class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login

  helper_method :current_user
    
  def current_user 
    @current_user ||= User.find_by(id: session[:user_id])
  end 

  private 
  
  def require_login
    redirect_to root_path unless current_user
  end 

end
