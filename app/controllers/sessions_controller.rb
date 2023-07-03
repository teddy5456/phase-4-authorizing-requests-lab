class SessionsController < ApplicationController
  
  def create
    # Assuming you have a User model with authentication, authenticate the user here.
    # For demonstration purposes, we'll set a dummy user for simplicity.
    user = User.find_by(username: params[:username])
    session[:user_id] = user.id if user

    # Redirect the user to the desired page after successful login
    redirect_to '/members_only_articles'
  end

  def destroy
    session.delete :user_id
    head :no_content
  end

end
