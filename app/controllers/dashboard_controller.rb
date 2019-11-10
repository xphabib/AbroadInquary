class DashboardController < ApplicationController
  layout 'dashboard'
  def index
    @students = Student.all
    @mentors = Mentor.all
  end
end
