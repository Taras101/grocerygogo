class ProductsController < ApplicationController

	def new
		@product = Product.new
		@product.prices.build
	end

	def create
		 @product = Product.new(product_params)
			 if @product.save
	  		redirect_to new_product_url
	  	else
	  		render :new
		end
	end

	def show
		@product = Product.find(params[:id])
	end

	def index
		if params[:store_id]
			@store = Store.find(params[:store_id])

			# Search scoped to the current store
			@products = Product.search(params[:search], @store)
		else
  		@products = Product.search(params[:search])
  	end
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
  	params.require(:product).permit(:name, :brand, :notes,
  																	prices_attributes: [:price, :measure, :amount, :store_id] )
  end

end
