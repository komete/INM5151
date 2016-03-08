class AccountsController < ApplicationController
  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      redirect_to profil_url
    else
      render 'new'
    end
  end

  :private

    def account_params
      params.require(:account).permit(:username, :password, :password_confirmation)
    end
end
