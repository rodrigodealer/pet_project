class Admin::ProductTagsController < ApplicationController
  before_action :set_product_tag, only: [:show, :edit, :update, :destroy]

  # GET /product_tags
  # GET /product_tags.json
  def index
    @product_tags = ProductTag.all
  end

  # GET /product_tags/1
  # GET /product_tags/1.json
  def show
  end

  # GET /product_tags/new
  def new
    @product_tag = ProductTag.new
  end

  # GET /product_tags/1/edit
  def edit
  end

  # POST /product_tags
  # POST /product_tags.json
  def create
    @product_tag = ProductTag.new(product_tag_params)

    respond_to do |format|
      if @product_tag.save
        format.html { redirect_to admin_product_tags_path(@product_tag), notice: 'Product tag was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /product_tags/1
  # PATCH/PUT /product_tags/1.json
  def update
    respond_to do |format|
      if @product_tag.update(product_tag_params)
        format.html { redirect_to admin_product_tags_path(@product_tag), notice: 'Product tag was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /product_tags/1
  # DELETE /product_tags/1.json
  def destroy
    @product_tag.destroy
    respond_to do |format|
      format.html { redirect_to admin_product_tags_url, notice: 'Product tag was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_tag
      @product_tag = ProductTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_tag_params
      params.require(:product_tag).permit(:name)
    end
end
