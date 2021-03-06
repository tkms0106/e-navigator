class InterviewsController < ApplicationController
  before_action :authenticate_user!, :set_user
  before_action :correct_user, only: [:new, :create, :edit, :update, :destroy, :apply]
  before_action :set_interview, only: [:edit, :update, :destroy, :approve]

  def index
    @interviews = @user.interviews.order(:scheduled_at)
    @other_users = User.where.not(id: @user.id)
  end

  def new
    @interview = Interview.new
    @path = user_interviews_path(@user.id)
  end

  def create
    @interview = @user.interviews.build(interview_params)
    @interview.availability = 'pending'
    if @interview.save
      flash[:notice] = '面接日程を生成しました。'
    else
      flash[:alert] = '面接日程の生成に失敗しました。'
    end
    redirect_to user_interviews_path
  end

  def edit
    @path = user_interview_path(@user.id, @interview.id)
  end

  def update
    if @interview.update(interview_params)
      flash[:notice] = '面接日程を更新しました。'
    else
      flash[:alert] = '面接日程の更新に失敗しました。'
    end
    redirect_to user_interviews_path(@user.id)
  end

  def destroy
    if @interview.destroy
      flash[:notice] = '面接日程を削除しました。'
    else
      flash[:alert] = '面接日程の削除に失敗しました。'
    end
    redirect_to user_interviews_path(@user.id)
  end

  def approve
    if current_user.name.blank?
      flash[:alert] = '承認者の名前が設定されている必要があります。'
    elsif @interview.approval!
      @user.interviews.where.not(id: @interview.id).update(availability: :disapproval)
      UserMailer.interview_date_decision_notification(@user, current_user, @interview.scheduled_at).deliver_now
      flash[:notice] = '承認通知メールを送信しました。'
    else
      flash[:alert] = '承認に失敗しました。'
    end
    redirect_to user_interviews_path(@user.id)
  end

  def apply
    if @user.name.blank?
      flash[:alert] = '自分の名前が設定されている必要があります。'
    elsif @user.interviews.count > 0
      interviewer = User.find(apply_params[:id])
      UserMailer.approval_request(@user, interviewer).deliver_now
      flash[:notice] = '承認依頼メールを送信しました。'
    else
      flash[:alert] = 'メールは送信されませんでした。面接希望日程を作成してください。'
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
      flash[:alert] = 'あなたの面接日程ではありません。'
      redirect_to authenticated_root_path
    end

    def set_interview
      @interview = @user.interviews.find(params[:id])
    end

    def apply_params
      params.require(:interviewer).permit(:id)
    end
end
