class DashboardController < ApplicationController
  layout 'dashboard'
  def index
    @students = Student.all if current_user.mentor?
    @mentors = Mentor.all if current_user.mentor? or current_user.student?
  end
end
