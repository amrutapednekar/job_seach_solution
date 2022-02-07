class JobsController < ApplicationController
  before_action :authorized
 
  # If user is loggeg in , finds all jobs
  def index
    @user = current_user
    @jobs = Job.all
  end

  # If user is loggeg in ,renders a form to create new job 
  def new
    @user = current_user
    @job = Job.new
  end

  # If user is loggeg in , creates new job
  # Accepts form value as parameters
  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to job_path(@job)
    else
      render :new
    end
  end

  # If user is loggeg in , show job
  #Job id comes as params[:id]
  def show
    @job = Job.find(params[:id])
  end

  # If user is loggeg in ,deletes a job
  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    redirect_to jobs_path
  end


  private 
  # Permits a job parameter
  def job_params
    params.require(:job).permit(:title, :salary_per_hour, :user_id, :shift_dates, languages: [])
  end

end
