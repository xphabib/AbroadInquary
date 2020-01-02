class DashboardController < ApplicationController
  layout 'dashboard'
  def index
    # flash[:success] = 'Dashboard'
    @total_schedules = Schedule.all.count
    @total_applications = StudentApplication.all.count
    @total_students = User.students.count
    @total_admins = User.admins.count

    @todays_schedules = Schedule.where("created_at=?", Date.today).count
    @todays_applications = StudentApplication.where("created_at=?", Date.today).count

    #only for mentor dashboard
    @mentor_total_schedules = current_user.mentor_schedules.count if current_user.mentor?
    @mentor_total_booked_schedules = current_user.mentor_schedules.student_schedules.count if current_user.mentor?

    #only for student dashboard
    @student_total_applications = current_user.student_applications.count if current_user.student?
    @student_total_schedules = current_user.student_schedules.count if current_user.student?

  end
end
