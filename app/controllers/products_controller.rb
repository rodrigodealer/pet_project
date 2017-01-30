class ProductsController < ApplicationController
  def index
    products = Product.all
    render :json => products, :include => { :brand => { :only => :name } }
  end
end
