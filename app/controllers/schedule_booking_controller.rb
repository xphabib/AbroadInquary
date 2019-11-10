class ScheduleBookingController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @mentors = Mentor.all
    p " >>>>>>>>>>>"
    p @mentors
    p " >>>>>>>>>>>"
  end
end
