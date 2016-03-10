class AccountsController < ApplicationController
  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      @account.create_profil
      redirect_to profil_path
    else
      render 'new'
    end
  end

  :private

    def account_params
      params.require(:account).permit(:username, :password, :password_confirmation)
    end
end
