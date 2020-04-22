class ContactsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new]

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])

    if @contact.save
      ContactsMailer.general_message(@contact).deliver
      render :thanks
    else
      render :new
    end
  end

  private

  def thanks
  end

end
