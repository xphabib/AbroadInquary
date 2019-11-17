class SchedulesController < ApplicationController
  layout 'dashboard'
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]
  def index
    @schedules = current_user.mentor_schedules if current_user.mentor?
    @schedules = Schedule.mentor_schedules if current_user.head_admin?
    @schedules = current_user.student_schedules if current_user.student?
  end

  def new
    @schedule = Schedule.new
  end


  def show
  end

  def edit
  end

  def create
    if current_user.mentor?
      @schedule = current_user.mentor_schedulesschedules.new(schedule_params)
    elsif current_user.head_admin?
      @schedule = Schedule.new(schedule_params)
      @schedule.mentor_id = params[:schedule][:mentor_id]
    end
    if @schedule.save!
      redirect_to @schedule
    else
      redirect_to new_schedule_path
    end
  end

  def update
    if @schedule.update(schedule_params)
      redirect_to @schedule
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @schedule.destroy
    redirect_back(fallback_location: root_path)
  end

  def booking_schedule

  end

  def booked_users

  end

  private
  def schedule_params
    params.require(:schedule).permit(:start_time, :end_time, :schedule_cost, :is_paid)
  end

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end
end
