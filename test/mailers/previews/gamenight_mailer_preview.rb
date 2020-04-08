# Preview all emails at http://localhost:3000/rails/mailers/gamenight_mailer
class GamenightMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/gamenight_mailer/cancelation_notice
  def cancelation_notice
    GamenightMailer.cancelation_notice
  end

end
