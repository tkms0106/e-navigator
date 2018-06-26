class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.approval_request.subject
  #
  def approval_request(interviewee, interviewer)
    @interviewee = interviewee
    mail to: interviewer.email, subject: "面接希望日が決まりました"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.approval_notification.subject
  #
  def approval_notification(interviewee, interviewer)
    @interviewer = interviewer
    mail to: interviewer.email, subject: "面接日時が確定しました"
  end
end
