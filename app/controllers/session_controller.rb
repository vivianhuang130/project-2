class SessionController < ApplicationController
  def new
  end

  def create
    #first, try and find the user by email in the dv
    @user = User.find_by_email(params[:login][:email])
    #if the user exists and they put in the right password
    if @user && @user.authenticate(params[:login][:password])
      #generate a cookie for the user
      #redirect them somewhere
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      #redirect them back to the login page
      redirect_to login_path

  end
end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
