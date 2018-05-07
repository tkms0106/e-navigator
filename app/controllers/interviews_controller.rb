class InterviewsController < ApplicationController
  before_action :authenticate_user!, :set_user
  before_action :correct_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_interview, only: [:edit, :update, :destroy, :approve]

  def index
    @interviews = @user.interviews.order(:scheduled_at)
  end

  def new
    @interview = Interview.new
    @path = user_interviews_path(@user.id)
  end

  def create
    @interview = @user.interviews.build(interview_params)
    @interview.availability = 'pending'
    if @interview.save
      flash[:notice] = 'Suscessfully created.'
    else
      flash[:alert] = 'Failed to create a interview candidate date and time.'
    end
    redirect_to user_interviews_path
  end

  def edit
    @path = user_interview_path(@user.id, @interview.id)
  end

  def update
    if @interview.update(interview_params)
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

  def approve
    if @interview.update(availability: :approval)
      @user.interviews.where.not(id: @interview.id).update(availability: :disapproval)
    else
      flash[:alert] = 'Failed to approve.'
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
      flash[:alert] = 'Only your own interviews can be accessed.'
      redirect_to authenticated_root_path
    end

    def set_interview
      @interview = @user.interviews.find(params[:id])
    end
end
