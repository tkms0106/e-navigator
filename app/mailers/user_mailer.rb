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
  #   en.user_mailer.interview_date_decision_notification.subject
  #
  def interview_date_decision_notification(interviewee, interviewer, datetime)
    @interviewee = interviewee
    @interviewer = interviewer
    @datetime = datetime
    mail to: [interviewee.email, interviewer.email], subject: "#{interviewee.name} さんの面接日時が確定しました"
  end
end
