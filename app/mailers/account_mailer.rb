class AccountMailer < ApplicationMailer

  def account_verification(user)
    @user = user
    mail to: "remi.guillaume.montreal@gmail.com" , subject: "Activation de compte"
  end


  def password_reset(user)
    @user = user
    mail to: @user.email, subject: "Réinitialisation du mot de passe"
  end

  def send_notification(user)
    @user = user
    mail to: @user.email, subject: "Activation de compte"
  end
end
