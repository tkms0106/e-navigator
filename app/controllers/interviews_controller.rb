class InterviewsController < ApplicationController
  def index
    @interviews = current_user.interviews
  end

  def new
    @interview = Interview.new
  end

  def create
    @interview = current_user.interviews.build(interview_params)
    if @interview.save
      flash[:notice] = 'Suscessfully created.'
    else
      flash[:alert] = 'Failed to create a interview.'
    end
    redirect_to interviews_path
  end

  private

    def interview_params
      params.require(:interview).permit(:scheduled_at)
    end
end
