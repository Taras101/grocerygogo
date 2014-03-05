class ProductsController < ApplicationController

	def new
		@product = Product.new
	end

	def create
		 @product = Product.new(product_params)
			 if @product.save
	  		redirect_to products_url
	  	else
	  		render :new
		end
	end
	def show
		@product = Product.find(params[:id])
	end

	def index
		@products = Product.all

	end

	def edit
			@product = Product.find(params[:id])
	end
	def destroy
		@product = Product.find(params[:id])
  		@product.destroy
  		redirect_to products_path
	end

	private

  def product_params
  	params.require(:product).permit(:name, :brand, :notes )
  end

end
