class DashboardController < ApplicationController
  layout 'dashboard'
  def index
    flash[:success] = 'Dashboard'
    @total_schedules = Schedule.all.count
    @total_applications = StudentApplication.all.count
    @total_students = User.students.count
    @total_admins = User.admins.count

    @today_schedule = Schedule

  end
end
