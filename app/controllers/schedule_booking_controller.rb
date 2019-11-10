class ScheduleBookingController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    # @mentors = Mentor.all.order(:first_name).page(params[:page]).per(10)
    @mentors = Mentor.where(["LOWER(country_name) LIKE ?","%#{params[:search].downcase}%"]).order(:first_name).page(params[:page]).per(10)
    # @mentors = Mentor.where(country_name: params[:search]).order(:first_name).page(params[:page]).per(10)
  end
end
