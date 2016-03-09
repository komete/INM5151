class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      AccountMailer.account_verification(@account).deliver_now
      flash[:info] = "Un email a été envoyé aux administrateurs pour la validation de votre compte."
      redirect_to root_path
    else
      render 'new'
    end
  end


  :private

    def user_params
      params.require(:user).permit(:nom, :prenom, :email, :poste, :telephone, :codeEmploye)
    end
end
