class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  layout 'dashboard'

  def my_profile ;end

  def index
    if params[:type].present? && params[:type] == 'student'
      @users = Student.all
    elsif params[:type].present? && params[:type] == 'mentor'
      @users = Mentor.all
    else
      @users = User.all
    end
    #
    # @mentors = Mentor.all
    # @students = Student.all

  end

  def show ;end

  def new
    @user = User.new
  end

  def create
    if @user = User.create!(set_params)
      redirect_to user_path(@user)
    else
      p @user.inspect
      @user.error
      p ">>>>>>>>>>"

    end
  end

  def edit ;end

  def update
    if @user.update!(set_params)
      redirect_to user_path(@user)
    end
  end

  def destroy
    if @user.destroy!
      redirect_to users_path
    end
  end

  private
  def set_user
    @user = User.friendly.find(params[:id])
    # @user = User.find(params[:id])
  end

  def set_params
    params.require(:user).permit! if params[:user].present?
    params.require(:student).permit! if params[:student].present?
    params.require(:mentor).permit! if params[:mentor].present?
  end
end
