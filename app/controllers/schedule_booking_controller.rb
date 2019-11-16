class ScheduleBookingController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    # @mentors = Mentor.all.order(:first_name).page(params[:page]).per(10)
    search_param = params[:search].downcase if params[:search].present?
    @mentors = User.mentor.where(["LOWER(country_name) LIKE ?","%#{search_param}%"]).order(:first_name).page(params[:page]).per(10)
    # @mentors = Mentor.where(country_name: params[:search]).order(:first_name).page(params[:page]).per(10)
  end

  def booking_schedule
    @schedule = Schedule.find(params[:schedule_id])
    @schedule.update(student_id: current_user.id)
  end
end
