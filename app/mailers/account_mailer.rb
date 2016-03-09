class AccountMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.account_mailer.account_verification.subject
  #
  def account_verification(account)
    #@user = User.find_by_idCompte(account.id)
    @user = account.user
    @account = account
    mail to: "guillaume.remi@courrier.uqam.ca;brien-lejeune.stephanie@courrier.uqam.ca;
    sawadogo.abdoul_faical@courrier.uqam.ca", subject: "Activation de compte"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.account_mailer.password_reset.subject
  #
  def password_reset(account)
    @user = account.user
    @account = account
    mail to: @user.email, subject: "Réinitialisation du mot de passe"
  end
end
