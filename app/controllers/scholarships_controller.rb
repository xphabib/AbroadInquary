class ScholarshipsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @scholarships = Scholarship.all
  end

  def show
    @scholarship = Scholarship.find_by(id: params[:id])
  end
end
