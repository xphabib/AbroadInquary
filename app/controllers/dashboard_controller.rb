class DashboardController < ApplicationController
  layout 'dashboard'
  def index
    @students = User.student #if current_user.mentor?
    @mentors = User.mentor #if current_user.mentor? or current_user.student?
  end
end
