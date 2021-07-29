# frozen_string_literal: true

class ContactsController < ApplicationController
  before_action :authenticate_user!

  def index
    @contact = current_user.contacts.new
  end

  def confirm
    @contact = current_user.contacts.new(contact_params)
    if @contact.valid?
      render :confirm
    else
      flash.now[:alert] = '入力内容が正しくありません'
      render :index
    end
  end

  def back
    @contact = current_user.contacts.new(contact_params)
    render :index
  end

  def create
    @contact = current_user.contacts.new(contact_params)
    if @contact.save
      ContactMailer.send_mail(@contact).deliver_now
      redirect_to thanx_path
    else
      flash.now[:alert] = '入力内容が正しくありません'
      render :index
    end
  end

  def thanx; end

  private

  def contact_params
    params.require(:contact).permit(:user_id, :name, :email, :subject, :message)
  end
end
