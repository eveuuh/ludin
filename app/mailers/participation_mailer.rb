class ParticipationMailer < ApplicationMailer

  def cancelation_notice(participation)
    @participation = participation
    @gamenight = @participation.gamenight
    @owner = @gamenight.boardgame.user
    @user = @participation.user

    mail to: @owner.email, subject: "La participation de #{@user.username} a été annulée... "
  end
end
