class InterviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, :correct_user
  before_action :set_interview, only: [:edit, :update, :destroy]

  def index
    @interviews = @user.interviews
  end

  def new
    @interview = Interview.new
  end

  def create
    @interview = @user.interviews.build(interview_params)
    if @interview.save
      flash[:notice] = 'Suscessfully created.'
    else
      flash[:alert] = 'Failed to create a interview candidate date and time.'
    end
    redirect_to user_interviews_path
  end

  def edit
  end

  def update
    if @interview.update(params[:scheduled_at])
      flash[:notice] = 'Successfully updated.'
    else
      flash[:alert] = 'Failed to update the interview candidate date.'
    end
    redirect_to user_interviews_path(@user.id)
  end

  def destroy
    if @interview.destroy
      flash[:notice] = 'Successfully destroyed.'
    else
      flash[:alert] = 'Failed to destroy the interview candidate date.'
    end
    redirect_to user_interviews_path(@user.id)
  end

  private

    def interview_params
      params.require(:interview).permit(:scheduled_at)
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def correct_user
      return if @user == current_user
      flash[:alert] = 'Only your own profile can be edited.'
      redirect_to authenticated_root_path
    end

    def set_interview
      @interview = @user.interviews.find(params[:id])
    end
end
