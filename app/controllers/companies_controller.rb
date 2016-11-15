class CompaniesController < ApplicationController

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to @company
    end
  end

  def show
    @company = Company.find(params[:id])
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update(company_params)
      redirect_to company_url(@company)
    else
      flash[:alert] = 'Não foi possível editar os dados da Empresa'
      render :edit
    end
  end

  def company_params
    params.require(:company).permit(:name, :location, :mail, :phone)
  end

end
