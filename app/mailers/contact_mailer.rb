class ContactMailer < ApplicationMailer

  def general_message(contact)
    @contact = contact
    mail to: "ludin.fun@gmail.com", subject: "You have a new message from LUD-IN website contact page"
  end
end
