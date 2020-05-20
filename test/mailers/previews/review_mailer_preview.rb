# Preview all emails at http://localhost:3000/rails/mailers/review_mailer
class ReviewMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/review_mailer/review_notification
  def review_notification
    ReviewMailer.review_notification
  end

  # Preview this email at http://localhost:3000/rails/mailers/review_mailer/send_review
  def send_review
    ReviewMailer.send_review
  end

end
