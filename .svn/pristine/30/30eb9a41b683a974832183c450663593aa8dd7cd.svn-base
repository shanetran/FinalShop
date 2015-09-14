module Admin
  class UsersController < ApplicationController
    before_filter :authenticate_user!
    before_filter :authenticate_admin!
    def index
      @users = User.all
    end

    def create
      if User.create(email: params[:users][:email], password: params[:users][:password],
      password_confirmation: params[:users][:password_confirmation], fullname: params[:users][:fullname],
      gender: params[:users][:gender], birthdate:  params[:users][:birthdate], role: params[:users][:role],
      phone: params[:users][:phone], address: params[:users][:address], key: SecureRandom.uuid,
      status: "Active").valid?
        flash[:success] = "Admin Create User Complete."
        redirect_to admin_root_path
      else
        flash[:error] = "Admin Create User Fail !!!"
        redirect_to admin_root_path
      end
    end

    def update
      if User.find(params[:id]).update(update_user_params)
        flash[:success] = "Admin Update User Complete."
        redirect_to admin_root_path
      else
        flash[:error] = "Admin Update User Fail !!!"
        redirect_to admin_root_path
      end
    end

    def destroy
      User.find(params[:id]).destroy
      flash[:success] = "Delete User Complete."
      redirect_to admin_root_path
    end

    private

    def update_user_params
      params.require(:users).permit(:fullname, :address, :birthdate, :role, :gender, :phone, :status)
    end
    
  end
end