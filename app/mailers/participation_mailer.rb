class ParticipationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.participation_mailer.cancelation_notice.subject
  #
  def cancelation_notice
    @participation = params[:participation]
    @gamenight = @participation.gamenight
    @owner = @gamenight.boardgame.user.username
    @user = @participation.user

    mail to: @user.email, subject: "La gamenight de #{@owner} a été annulée... "
  end
end
