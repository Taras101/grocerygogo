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
			respond_to do |format|
			# Search scoped to the current store
				format.html { @products = Product.search(params[:search], @store) }
				format.js { }
			end

		else
  		@products = Product.search(params[:search])

  	end
	end


	def edit
		@product = Product.find(params[:id])
	end

	def update
    @product = Product.find(params[:id])
    	if @product.update_attributes(product_params)
     	 redirect_to products_path(@product)
   		else
      	render :edit
    	end
  end

	def destroy
		@product = Product.find(params[:id])
  	@product.destroy
  	redirect_to products_path
	end

	private

  def product_params
  	params.require(:product).permit(:name, :brand, :notes,
  																	prices_attributes: [:id, :price, :measure, :amount, :store_id,:valid_from, :valid_to] )
  end

end
