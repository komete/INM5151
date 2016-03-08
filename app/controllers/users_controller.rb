class UsersController < ApplicationController
  def connect
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save

    else
      render 'new'
    end
  end


  :private

    def user_params
      params.require(:user).permit(:nom, :prenom, :email, :poste, :telephone, :codeEmploye)
    end
end
