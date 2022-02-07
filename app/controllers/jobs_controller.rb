class JobsController < ApplicationController
  before_action :authorized

  def index
    @user = current_user
    @jobs = Job.all
  end

  def new
    @user = current_user
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to job_path(@job)
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    redirect_to jobs_path
  end


  private 
  def job_params
    params.require(:job).permit(:title, :salary_per_hour, :user_id, :shift_dates, languages: [])
  end

end
