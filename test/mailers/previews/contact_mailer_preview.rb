# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/gamenight_mailer/cancelation_notice
  def cancelation_notice
    ContactMailer.general_message
  end

end
