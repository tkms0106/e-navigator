class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, :correct_user, only: [:edit, :update]

  def index
    @users = User.where.not(id: current_user.id)
  end

  def edit
  end

  def update
    unless @user.update(user_params)
      flash[:alert] = 'プロフィールの更新に失敗しました。'
    end
    redirect_to users_path
  end

  private

    def user_params
      params.require(:user).permit(:name, :date_of_birth, :gender, :school)
    end

    def set_user
      @user = User.find(params[:id])
    end

    def correct_user
      return if @user == current_user
      flash[:alert] = 'あなたのユーザー情報ではありません。'
      redirect_to authenticated_root_path
    end
end
