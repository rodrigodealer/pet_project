class ProductsController < ApplicationController
  def index
    products = Product.all
    render :json => {}, :include => { :brand => { :only => :name } }
  end

  def search_from_post
    redirect_to :action => 'search', :name => params[:q]
  end

  def search
    begin
      @products = Product.search(params.require([:name])).records
    rescue
      redirect_to root_path
    end
  end

  def show
    begin
      @product = Product.find(params.require(:id))
    rescue
      redirect_to root_path
    end
  end
end
