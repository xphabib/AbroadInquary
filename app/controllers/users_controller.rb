class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  layout 'dashboard'
  def index
    @users = User.all
  end

  def show

  end

  def new
    @user = User.new
  end

  def create
    if @user = User.create(set_params)
      redirect_to @user
    end
  end

  def edit
  end

  def update
    if @user.update!(set_params)
      redirect_to @user
    end
  end

  def destroy
    if @user.destroy!
      redirect_to users_path
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def set_params
    params.require(:user).permit!
  end
end
