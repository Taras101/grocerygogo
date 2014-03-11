class StoresController < ApplicationController
  before_filter :not_authenticated
  def index
  	@store = Store.all
  end

  def show
  	@store = Store.find(params[:id])
  end
  def create
		@store = Store.new(store_params)
		  if @store.save
  		  redirect_to stores_url
  	  else
  		  render :new
  	  end
	end

  def new
  	@store = Store.new
  end

  def edit
  end
	private

	def store_params
	  params.require(:store).permit(:name)
	end
end
