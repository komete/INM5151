class AccountsController < ApplicationController
  def create
    @account = Account.new
  end

  def save
    @account = Account.new(account_params)
    if @account.save
    else
      render 'create'
    end
  end

  :private

    def account_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
