class UsersController < ApplicationController
  before_action :authorize, only: [:show]
  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params) #only  secure those three fields
    if @user.save
      redirect_to users_path

    else
      redirect_to new_user_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private #only available here
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
