class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @user = user

    mail to: user.email, subject: "Bienvenue sur Lud-In"
  end

  def cancelation(gamenight)
    @users = gamenight.participation.user

    @users.each do |user|
      mail to: user.email, subject: ""
    end
  end
end
