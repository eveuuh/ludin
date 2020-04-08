class GamenightMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.gamenight_mailer.cancelation_notice.subject
  #
  def cancelation_notice(gamenight)

    @gamenight = gamenight
    @owner = gamenight.boardgame.user.username
    @users = gamenight.participations.user

    @users.each do |user|
      mail to: user.email, subject: "#{@owner}' s gamenight is canceled ..."
    end
  end
end
