class GamenightMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.gamenight_mailer.send_cancelation_notice.subject
  #
  def self.send_cancelation_notice(gamenight)
    @participations = gamenight.participations
    @users = []
    @participations.each do |participation|
      @users << participation.user
    end
    @users.each do |user|
      cancelation_notice(user, gamenight).deliver_now
    end
  end

  def cancelation_notice(user, gamenight)
    @name = user.username
    @location = gamenight.location.name
    @date = gamenight.date
    @owner = gamenight.boardgame.user

    mail to: user.email, subject: "La gamenight de #{@owner.username} a été annulée..."
  end

end
