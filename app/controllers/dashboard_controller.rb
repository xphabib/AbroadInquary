class DashboardController < ApplicationController
  layout 'dashboard'
  def index
    @users = User.all
  end
end
