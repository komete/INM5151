module UsersHelper
  def end_profil
    session.delete(:account)
  end
end
