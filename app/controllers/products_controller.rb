class ProductsController < ApplicationController

	def new
		@product = Product.new
	end

	def create
		 @product = Product.new(product_params)
	end

	def show
		@product = Product.find(params[:id])
	end

	def index
	end
	def destroy
		@product = Product.find(params[:id])
  		@product.destroy
  		redirect_to products_path
	end

	private

  def product_params
  	params.require(:product).permit(:name, :desc, :notes )
  end

end
