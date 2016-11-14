class JobsController < ApplicationController

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to @job
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:title, :category, :company_id, :description, :location, :featured)
  end

end
