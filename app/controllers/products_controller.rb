class ProductsController < ApplicationController
  def index
    products = Product.all
    render :json => {}, :include => { :brand => { :only => :name } }
  end

  def search
    begin
      @products = Product.search(params.require(:q)).records
    rescue
      redirect_to root_path
    end
  end
end
