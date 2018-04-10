class InterviewsController < ApplicationController
  def index
    @user = set_user
    @interviews = @user.interviews
  end

  def new
    @user = set_user
    @interview = Interview.new
  end

  def create
    @user = set_user
    @interview = @user.interviews.build(interview_params)
    if @interview.save
      flash[:notice] = 'Suscessfully created.'
    else
      flash[:alert] = 'Failed to create a interview.'
    end
    redirect_to user_interviews_path
  end

  private

    def set_user
      user = User.find_by(id: params[:user_id])
    end

    def interview_params
      params.require(:interview).permit(:scheduled_at)
    end
end
