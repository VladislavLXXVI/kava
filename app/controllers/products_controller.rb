# app/controllers/products_controller.rb
class ProductsController < ApplicationController
    before_action :set_product, only: [:edit, :update, :destroy, :view]
  
    def index
      @products = Product.all
    end
  
    def new
      @product = Product.new
    end
  
    def create
      @product = Product.new(product_params)
      if @product.save
        redirect_to products_path, notice: 'Product was successfully created.'
      else
        render :new
      end
    end
  
    def edit
      # Действие edit для редактирования продукта
    end
  
    def update
      if @product.update(product_params)
        redirect_to view_product_path(@product), notice: 'Product was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
        @product = Product.find(params[:id])
        @product.destroy
        redirect_to products_path, notice: 'Product was successfully deleted.'
    end
  
    def view
      @product = Product.find(params[:id])
    end
  
    private
  
    def set_product
      @product = Product.find(params[:id])
    end
  
    def product_params
      params.require(:product).permit(:name, :description, :price, :image)
    end
end
  