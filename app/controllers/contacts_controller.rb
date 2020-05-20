class ContactsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]
  after_action :send_mail, only: [:create]

  def new
    @contact = Contact.new
    authorize @contact
  end

  def create
    @contact = Contact.new(contact_params)
    authorize @contact

    if @contact.save
      # render :thanks
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end

  def send_mail
    ContactMailer.with(contact: self).general_message(@contact).deliver_now
  end

  # def thanks
  # end

end
