class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome,:logout]

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
       session[:user_id] = @user.id
       redirect_to '/welcome'
    else
       redirect_to '/login'
    end

  end

  def login
  end
 
  def logout
    session[:user_id] = nil 
    redirect_to '/welcome'
  end

  def welcome
  end

  def page_requires_login
  end



  def authorized
    redirect_to '/welcome' unless logged_in?
end
end