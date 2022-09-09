class UsersController < ApplicationController
  before_action :authenticate_user!
  def edit
    @user = current_user
  end

  def show; end

  def update_password
    @user = current_user
    if @user.update_with_password(user_params)
      # Sign in the user by passing validation in case their password changed
      bypass_sign_in(@user)
      redirect_to users_edit_password_path, notice: "Password was updated successfully."
    else
      redirect_to users_edit_password_path, alert: "Can't update the password."
    end
  end

  def user_params
    params.require(:user).permit(:password, :password_confirmation, :current_password, :avatar)
  end
end