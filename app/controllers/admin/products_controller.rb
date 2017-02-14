class Admin::ProductsController < ApplicationController
  before_filter :tags_strip_null, :only => [:create, :update]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @brands = Brand.all
    @product_tags = ProductTag.all
  end

  def create
    product = Product.new(product_params)

    product.files = product_params[:files] if product_params[:files]
    if product.save
      redirect_to action: :index
    else
      render :new, :alert => 'Error'
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      redirect_to action: :index
    else
      render :edit, :alert => 'Error'
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to action: :index
  end

  def edit
    @product = Product.find(params[:id])
    @brands = Brand.all
    @product_tags = ProductTag.all
  end

  def properties_edit
    @product = Product.find(params[:product_id])
    @options = ProductOption.all
  end

  def properties_remove
    product = Product.find(params[:product_id])
    product.properties = product.properties.delete_if {|key, value| key == params[:key] && value == params[:value] }
    product.save
    redirect_to action: :properties_edit, product_id: params[:product_id]
  end

  def properties_save
    product = Product.find(params[:product_id])
    product.properties.store(params[:key], params[:value])
    product.save
    redirect_to action: :properties_edit, product_id: params[:product_id]
  end

  private
  def tags_strip_null
    params[:product][:tags].delete("0") if params[:product][:tags] && params[:product][:tags].include?("0")
  end

  def product_params
    params.require(:product).permit(:name, :brand_id, :price, :available, :height, :width, :weight, :description, :depth, {files: []}, {tags: []})
  end
end
