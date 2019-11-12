class DashboardController < ApplicationController
  layout 'dashboard'
  def index
    @students = Student.all if current_user.student? or current_user.mentor?
    @mentors = Mentor.all if current_user.mentor?
  end
end
