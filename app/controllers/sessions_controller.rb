class SessionsController < ApplicationController
  def log_in
    if request.post?
      author = Author.find_by_email(params[:email])
      if author && author.authenticate(params[:password])
        session[:author_id] = author.id
        flash[:notice] = "Welcome!"
        redirect_to surveys_path
      else
        flash.now[:notice] = "Invalid e-mail or password."
      end
    end
  end

  def log_out
    session[:author_id] = nil
    redirect_to sessions_log_in_path
  end
end
