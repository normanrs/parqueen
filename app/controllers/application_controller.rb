class ApplicationController < ActionController::Base
  helper_method :curent_user

  def current_user
    @current_user ||= User.find(session[:id]) if session[:id]
  end

end
