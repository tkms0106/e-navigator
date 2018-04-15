class InterviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, :correct_user

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
      flash[:alert] = 'Failed to create a interview.'
    end
    redirect_to user_interviews_path
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
end
