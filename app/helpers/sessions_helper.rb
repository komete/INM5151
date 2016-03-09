module SessionsHelper
  def log_in(account)
    user = User.find_by_idCompte(account.id)
    session[:user_id] = user.id
  end

  def log_out
    user = current_user
    account = Account.find_by(id: user.idCompte)
    forget(account)
    session.delete(:user_id)
    @current_user = nil
  end

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      account = Account.find_by(id: user.idCompte)
      if account && account.authenticated?(cookies[:remember_token])
        log_in account
        @current_user = user
      end
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def remember(account)
    Account.remember
    cookies.permanent.signed[:user_id] = User.find_by_idCompte(account.id)
    cookies.peermanent[:remember_token] = account.remember_token
  end

  def forget(account)
    Account.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end
end
