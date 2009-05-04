class AccountController < ApplicationController
  def login
    @user ||= User.new
  end

  def logout
    session[:user_id]=nil if session[:user_id]
    flash[:notice]="Yep! You are logged out."
    redirect_to root_url
  end
  def do_login
    username=params[:user][:username] if params[:user]
    password=params[:user][:password] if params[:user]
    @user=User.authenticate(username,password) if username and password
    if @user
      session[:user_id]=@user.user_id
      redirect_to root_url
      flash[:notice]="Yep! You are logged in."
    else
      redirect_to session_path(:login)
      flash[:error]="Oops! Your username or password is bad."
    end
  end
end
