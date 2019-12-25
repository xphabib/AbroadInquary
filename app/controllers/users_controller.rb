class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:request_for_new_mentorship, :create_request_for_new_mentorship]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  layout 'dashboard'
  # layout 'application', only: [:request_for_new_mentorship]

  def my_profile ;end
  def edit_my_profile
  end

  def update_my_profile
    current_user.admin_confirmation = false
    if current_user.update!(set_params)
      flash[:warning] = 'Your Account is Under Review'
      redirect_to root_path
    end
  end


  def index
    if params[:type].present? && params[:type] == 'student'
      @users = User.students.order(:first_name).page(params[:page]).per(10)
    elsif params[:type].present? && params[:type] == 'mentor'
      @users = User.mentors.order(:first_name).page(params[:page]).per(10)
    else
      @users = User.all.order(:first_name).page(params[:page]).per(10)
    end
    #
    # @mentors = Mentor.all
    # @students = Student.all

  end

  def request_for_new_mentorship
    @user = User.new
    respond_to do |format|
      format.html {render :layout => 'dashboard'}
    end
  end

  def create_request_for_new_mentorship
    @user = User.new(mentor_request_params)
    @user.role = 'mentor'
    if @user.save
      redirect_to root_path
    else
      p '<<<<<<<<<<<<<<<@user.inspect>>>>>>>>>>>>>>>'
      p @user.errors.full_messages.to_sentence
      p ">>>>>>>>>>"
      flash[:error] = @user.errors.full_messages.to_sentence
      redirect_to request_for_new_mentorship_path
    end
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
      p @user.errors.full_messages.to_sentence
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
    params.require(:user).permit!
  end

  def mentor_request_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end
