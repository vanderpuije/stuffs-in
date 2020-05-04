class CategoriesController < ApplicationController
  before_action :require_admin, except: [:index, :show]



  def index
    @categories = Category.paginate(page: params[:page],per_page: 5)

  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:success] = "Category was created successfully"
      redirect_to root_path

    else
       respond_to do |format|
       format.html { render :new }
       format.json { render json: @product.errors, status: :unprocessable_entity }

    end
  end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
    flash[:success] = "Category name was successfully updated"
    redirect_to category_path(@category)
    else
    render 'edit'
    end
  end

 

  def show
    @category = Category.find(params[:id])
    @category_articles = @category.products.paginate(page: params[:page], per_page: 5)

  end

  private
  def category_params
    params.require(:category).permit(:name)
    
  end

  def require_admin
    if !seller_signed_in? || (seller_signed_in? and !current_seller.admin?)
      flash[:danger] = "Only admins can perform that action"
      redirect_to categories_path

    end

    
  end
end

