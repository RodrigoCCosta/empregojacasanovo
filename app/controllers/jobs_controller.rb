class JobsController < ApplicationController

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to job_url(@job)
    else
      flash[:alert] = 'Não foi possível criar a vaga'
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
      @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to job_url(@job)
    else
      flash[:alert] = 'Não foi possível atualizar a vaga'
      render :edit
    end
  end

  def job_params
    params.require(:job).permit(:title, :location, :category_id, :company_id, :description, :featured)
  end

end
