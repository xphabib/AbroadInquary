class ScheduleMailer < ApplicationMailer
  default :from => "from@example.com"

  def mentor_confirmation(mentor_email, start_time, end_time, schedule_cost)
    @start_time = start_time
    @end_time = end_time
    @schedule_cost = schedule_cost
    mail(to: mentor_email, subject: "Schedule Confirmation")
  end

  def student_confirmation(student_email, start_time, end_time, schedule_cost)
    @start_time = start_time
    @end_time = end_time
    @schedule_cost = schedule_cost
    mail(to: student_email, subject: "Schedule Confirmation")
  end
end
