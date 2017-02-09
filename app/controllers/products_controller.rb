class ProductsController < ApplicationController
  def index
    products = Product.all
    render :json => {}, :include => { :brand => { :only => :name } }
  end

  def search
    @products = Product.search(params[:q])
  end
end
