class UserMailerPreview < ActionMailer::Preview

  def approval_request
    user = User.first
    another_user = User.second
    UserMailer.approval_request(user, another_user)
  end

  def interview_date_decision_notification
    user = User.first
    another_user = User.second
    UserMailer.interview_date_decision_notification(user, another_user, Time.now)
  end
end
