class CountriesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @countries = Country.all
  end

  def show
    @country = Country.find_by(id: params[:id])
    @mentors = @country.users.mentor
  end
end
