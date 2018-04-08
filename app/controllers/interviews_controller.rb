class InterviewsController < ApplicationController
  def index
    @interviews = current_user.interviews
  end

  def new
  end

  def create
  end
end
