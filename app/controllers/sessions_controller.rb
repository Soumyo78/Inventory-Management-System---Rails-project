class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to request.referrer
      flash[:success] = "Welcome to Henlo IMS, #{user.name}!"
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
    else
      redirect_to request.referrer
      flash[:danger] = "Invalid email/password combination"
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
