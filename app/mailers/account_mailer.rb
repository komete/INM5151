class AccountMailer < ApplicationMailer

  def account_verification(user)
    @user = user
    mail to: "guillaume.remi@courrier.uqam.ca;brien-lejeune.stephanie@courrier.uqam.ca;
    sawadogo.abdoul_faical@courrier.uqam.ca", subject: "Activation de compte"
  end


  def password_reset(user)
    @user = user
    mail to: @user.email, subject: "Réinitialisation du mot de passe"
  end
end
