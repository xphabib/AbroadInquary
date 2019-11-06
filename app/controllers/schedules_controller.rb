class SchedulesController < ApplicationController
  layout 'dashboard'
  def index
  end
  def new
    @schedule = Schedule.new
  end
end
