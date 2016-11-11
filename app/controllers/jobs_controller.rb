class JobsController < ApplicationController

#  def new
#    @jobs = Job.new
#  end

  def create
    @job = Job.create(job_params)
  end

  def show
    @job = Job.find(params[:id])
  end

#  def job_params
#      params.require(:job).permit(:title, :category, :company, :description, :location)
#  end

end
