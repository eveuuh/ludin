class ReviewMailer < ApplicationMailer

  def write_review(participation)
    @gamenight = participation.gamenight
    @owner = @gamenight.boardgame.user
    @user = participation.user
    if !participation.rating
      mail to: @user.email, subject: "N'oubliez pas de laisser un commentaire à #{@owner.username}"
    end
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.review_mailer.send_review.subject
  #
  def review_notification(participation)
    @gamenight = participation.gamenight
    @owner = @gamenight.boardgame.user
    @user = participation.user
    @hours = @gamenight.date
    if participation.rating?
      mail to: @owner.email, subject: "#{@user.username} vous a laissé un commentaire"
    end
  end
end
