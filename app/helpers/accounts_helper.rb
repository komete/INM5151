module AccountsHelper
  def create_profil
    session[:account] = @account
  end
end
