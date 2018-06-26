class UserMailerPreview < ActionMailer::Preview

  def approval_request
    user = User.first
    another_user = User.second
    UserMailer.approval_request(user, another_user)
  end

  def approval_notification
    user = User.first
    another_user = User.second
    UserMailer.approval_notification(user, another_user)
  end
end
