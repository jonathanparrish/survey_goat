class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  private

  def current_user
    @current_user = Author.find_by_id(session[:author_id])
  end

  def logged_in?
    if current_user.nil?
      redirect_to sessions_log_in_path
    end
  end
end
