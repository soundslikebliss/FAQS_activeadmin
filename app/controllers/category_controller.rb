class CategoryController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]


  def index
    @category = Category.all
  end

  
  def show
  end


  def new
    @category = Category.new
  end

  def edit
  end


  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to @category, notice: 'category was successfully created.'
    else
      render :new
    end
  end

  def update
    if @category.update(category_params)
      redirect_to @category, notice: 'category was successfully updated.'
    else
      render :edit
    end
  end


  def destroy
    @category.destroy
    redirect_to categories_url, notice: 'category was successfully destroyed.'
  end

  private
   
    def set_category
      @category = Category.find(params[:id])
    end


    def category_params
      params.require(:category).permit(:name, :faq_id)
    end
end