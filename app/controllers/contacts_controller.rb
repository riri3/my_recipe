class ContactsController < ApplicationController
  def index
    @contact = current_user.contacts.new
  end

  def confirm
    @contact = current_user.contacts.new(contact_params)
    if @contact.invalid?
      render :index
    end
  end

  def back
    @contact = Contact.new(contact_params)
    render :new
  end

  def create
    @contact = current_user.contacts.new(contact_params)
    if @contact.save
      ContactMailer.send_mail(@contact).deliver_now
      redirect_to thanx_path
    else
      render :index
    end
  end

  def thanx
  end


  private
  def contact_params
    params.require(:contact).permit(:user_id, :name, :email, :subject, :message)
  end
end
