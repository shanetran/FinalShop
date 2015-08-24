class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def update
    if User.find(params[:id]).update(update_users_params)
      flash[:success] = "User update complete."
      redirect_to root_path
    else
      flash[:error] = "User udpate fail !!!"
      render 'edit'
    end
  end

  private

  def update_users_params
    params.require(:users).permit(:fullname, :birthdate, :address, :gender, :phone)
  end
end