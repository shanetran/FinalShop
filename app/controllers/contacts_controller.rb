class ContactsController < ApplicationController
  def create
    @user = Contact.new(contacts_params)
    if @user.save
      UserMailer.contact_mail(@user).deliver
      flash[:success] = "Sending message complete."
      redirect_to root_path
    else
      flash[:error] = "Sending message fail. Please try again."
      redirect_to :back
    end
  end

  private

  def contacts_params
    params.require(:contacts).permit(:name, :email, :message)
  end
end