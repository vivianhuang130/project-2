class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in, :authorize #makes it globally accessible

  def current_user
    session[:user_id] = nil

    @current_user ||= User.find(session[:user_id]) if session[:user_id]
#same

  #   if session[:user_id]
  #     @current_user = User.find(session[:user_id])
  #     if @current_user
  #       return @current_user
  #     else return nil
  #   end
  # end
end
  def logged_in
    !!current_user
  end
  def authorize
    redirect_to login_path unless logged_in
  end

  # def destroy
  #   @haiku = Haiku.fin(params[:id])
  #   @haiku.destroy
  #   redirect_to haikus_path
  # end
end
