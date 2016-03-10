class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to recherches_path
    else
      flash.now[:danger] = 'Combinaison invalide courriel et/ou mot de passe'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
