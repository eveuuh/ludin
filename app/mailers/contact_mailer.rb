class ContactMailer < ApplicationMailer

  def general_message
    @contact = params[:contact]
    mail to: "ludin@gmail.com", subject: "You have a message from LUD-IN website"
  end
end
