class InterviewsController < ApplicationController
  before_action :set_user

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

    def set_user
      @user = User.find_by(id: params[:user_id])
    end

    def interview_params
      params.require(:interview).permit(:scheduled_at)
    end
end
