class UsersController < ApplicationController
  def index
    @users = User.where.not(id: current_user.id)
  end

  def edit
    @user = current_user
  end

  def update
    unless current_user.update_attributes(user_params) then
      flash[:danger] = 'Failed to update profile.'
    end
    redirect_to users_path
  end

  private

    def user_params
      params.require(:user).permit(:name, :date_of_birth, :gender, :school)
    end
end
