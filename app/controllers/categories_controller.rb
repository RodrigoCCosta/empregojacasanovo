class CategoriesController < ApplicationController

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to category_url(@category)
    else
      flash[:alert] = 'Não foi possível editar os dados da Categoria'
      render :edit
    end
  end

  def category_params
    params.require(:category).permit(:name)
  end

end
