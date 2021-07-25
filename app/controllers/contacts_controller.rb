class ContactsController < ApplicationController
  def index
    @contact = current_user.contacts.new

  end

  def create
    @contact = current_user.contacts.new(contact_params)
    if @contact.save
      flash[:notice] = "新しいレシピを登録しました！"
      ContactMailer.contact_mail(@contact).deliver
      redirect_to confirm_path
    else
      render :index
    end
  end

  def confirm
    
  end

  def thanx
  end


  private
  def contact_params
    params.require(:confirm).permit(:user_id, :name, :email, :subject, :message)
  end
end
