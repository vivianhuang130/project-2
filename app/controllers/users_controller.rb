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
    @user = User.find params[:id] #when you edit the user already exists in the db
  end

  def update

    @user = User.find(params[:id])
      if @user.update_attributes(user_params)
        redirect_to user_path
      else
        redirect_to edit_user_path
      end
  end

  def destroy
    @user = User.find(params[:id])
      if @user.destroy
        session[:user_id] #destroy current user id from this session
        redirect_to users_path #redirect to homepage, index
      else
        redirect_to edit_user_path #redirects to the same user, edit path
      end
    end

  private #only available here
  def user_params
    params.require(:user).permit(:name, :tagline, :bio, :password, :pic_url)
  end
end
