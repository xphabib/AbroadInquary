class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:request_for_new_mentorship, :create_request_for_new_mentorship]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  layout 'dashboard'
  # layout 'application', only: [:request_for_new_mentorship]

  def my_profile;

  end

  def edit_my_profile
    authorize! :update, User
    @countries = Country.all.order(:name)
  end

  def update_my_profile
    authorize! :update, User
    unless current_user.student?
      current_user.admin_confirmation = false
      if current_user.update!(set_params)
        flash[:warning] = 'Your Account is Under Review'
        redirect_to root_path
      end
    else
      if current_user.update!(set_params)
        flash[:warning] = 'Your Accout is updated'
        redirect_to my_profile_users_path
      end
    end
  end


  def index
    authorize! :read, User
    if params[:type].present? && params[:type] == 'student'
      if current_user.student?
        authorize! :manage, User
      end
      @users = User.students.order(:first_name).page(params[:page]).per(10)
    elsif params[:type].present? && params[:type] == 'mentor'
      if current_user.student?
        @users = User.mentors.confirmed_users.order(:first_name).page(params[:page]).per(10)
      else
        @users = User.mentors.order(:first_name).page(params[:page]).per(10)
      end
    else
      authorize! :manage, User
      @users = User.all.order(:first_name).page(params[:page]).per(10)
    end
    #
    # @mentors = Mentor.all
    # @students = Student.all

  end

  def request_for_new_mentorship
    @countries = Country.all.order(:name)
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
      flash[:error] = @user.errors.full_messages.to_sentence
      redirect_to request_for_new_mentorship_path
    end
  end

  def show
    authorize! :read, @user
    if @user.id == current_user.id
      redirect_to my_profile_users_path
    end
  end

  def new
    @user = User.new
    @countries = Country.all.order(:name)
    authorize! :create, @user
  end

  def create
    authorize! :create, User
    if @user = User.create!(set_params)
      redirect_to user_path(@user)
    else
    end
  end

  def edit
    authorize! :update, User
    @countries = Country.all.order(:name)
  end

  def update
    authorize! :update, User
    if @user.update!(set_params)
      redirect_to user_path(@user)
    end
  end

  def destroy
    authorize! :destroy, User
    if @user.destroy!
      redirect_to users_path
    end
  end

  def unconfirmed_user
    authorize! :update, User
    @users = User.unconfirmed_users
  end

  def lock
    authorize! :update, User
    user = User.friendly.find(params[:id])
    user.update(admin_confirmation: false)
    redirect_to user_path(user)
  end

  def unlock
  authorize! :update, User
  user = User.friendly.find(params[:id])
    user.update(admin_confirmation: true)
    redirect_to user_path(user)
  end

  def confirm
    user = User.friendly.find(params[:id])
    user.update(admin_confirmation: true)
    redirect_to user_path(user)
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
    params.require(:user).permit!#(:first_name, :last_name, :email, :password)
  end

end
