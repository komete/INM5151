class UsersController < ApplicationController
  before_action :logged_admin, only: [:gestion]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_verification_email
      flash[:info] = "Un email a été envoyé aux administrateurs pour la validation de votre compte."
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:succes] = "Utilisateur mis à jours"
      redirect_to user_path
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.is_now_desactivated
    flash[:info] = "Utilisateur désactivé"
    redirect_to gestion_path
  end

  def gestion
    @users = User.all
  end

  :private

  def correct_user
    user = current_user
    unless user.id == params[:id] || user.administrateur
      flash[:danger] = "Vous n'avez pas l'authorisation d'effectuer cette action !"
      redirect_to root_path
    end
  end

  def logged_admin
    user = current_user
    unless logged_in? && user.administrateur
      flash[:danger] = "Vous n'avez pas l'authorisation d'être sur cette page !"
      redirect_to root_path
    end
  end

    def user_params
      params.require(:user).permit(:nom, :prenom, :email, :poste, :telephone, :codeEmploye, :username, :password, :password_confirmation)
    end
end
