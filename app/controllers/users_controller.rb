class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  # Renders a for to create new user
  def new
    @user = User.new
  end

  # Accepts parameters from signup form
  # Creates new user.
  # Sets sessionof user.
  # Redirects to welcome page.
  def create
    @user = User.new(params.require(:user).permit(:email,:password))
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/welcome'
    else
      render :new
    end

  end

  # When user click on Apply , Creates an entry in joint table UserAppliedJob
  # with user as current user and for selected job. 
  # Status true = Job Applied
  # Rediects to jobs page 
  def apply_job()
    applied_job = UserAppliedJob.new(:user_id => current_user.id, :job_id => params[:id],:status => true)
      if applied_job.save
      redirect_to '/jobs'
    end
  end

end
