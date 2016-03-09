class PasswordResetsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.account.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = "Un email vous a été envoyé avec les instructions"
      redirect_to root_url
    else
      flash.now[:danger] = "Adresse email invalide et/ou inconnue"
      render 'new'
    end
  end

  def edit
  end
end
