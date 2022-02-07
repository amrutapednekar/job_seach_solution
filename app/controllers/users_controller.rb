class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:email,:password))
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/welcome'
    else
      render :new
    end

  end

  
  def apply_job()
    applied_job = UserAppliedJob.new(:user_id => current_user.id, :job_id => params[:id],:status => true)
      if applied_job.save
      redirect_to '/jobs'
    end
  end

end
