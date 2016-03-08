class SessionsController < ApplicationController
  def new

  end
  def create
    account = Account.find_by(username: params[:session][:username])
    if account && account.authenticate(params[:session][:password])
      log_in account
      redirect_to recherches_path
    else
      flash.now[:danger] = 'Combinaison invalide courriel et/ou mot de passe'
      render 'new'
    end
  end
  def destroy

  end
end
