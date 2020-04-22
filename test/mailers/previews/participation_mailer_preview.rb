# Preview all emails at http://localhost:3000/rails/mailers/participation_mailer
class ParticipationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/participation_mailer/cancelation_notice
  def cancelation_notice
    ParticipationMailer.cancelation_notice
  end

end
