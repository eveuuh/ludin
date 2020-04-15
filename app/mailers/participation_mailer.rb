class ParticipationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.participation_mailer.cancelation_notice.subject
  #
  def cancelation_notice
    @greeting = "Hi"

    mail to: @user.email, subject: "La gamenight a été annulée..."
  end
end
