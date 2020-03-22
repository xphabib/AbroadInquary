class StudentApplicationMailer < ApplicationMailer

  def mentor_confirmation(mentor_email)
    mail(to: mentor_email, subject: "Schedule Confirmation")
  end

  def student_confirmation(student_email)
    mail(to: student_email, subject: "Schedule Confirmation")
  end
end
