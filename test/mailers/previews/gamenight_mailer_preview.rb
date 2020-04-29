# Preview all emails at http://localhost:3000/rails/mailers/gamenight_mailer
class GamenightMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/gamenight_mailer/send_cancelation_notice
  def send_cancelation_notice
    GamenightMailer.send_cancelation_notice
  end

end
