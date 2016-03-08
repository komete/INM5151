module SessionsHelper
  def log_in(account)
    user = User.find_by_idCompte(account.id)
    session[:user_id] = user.id
  end
end
