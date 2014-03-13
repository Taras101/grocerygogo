class GroceryItemsController < ApplicationController
  before_filter :not_authenticated
  def new
    @groceryitem = GroceryItem.new
    @groceryitems = current_user.grocery_items
  end

  def create
    @groceryitem = GroceryItem.new(groceryitem_params)
    @groceryitem.user = current_user
    if @groceryitem.save
      redirect_to new_user_grocery_item_url
    else
      render :new
    end
  end

  def show
    @groceryitem = GroceryItem.find(params[:id])
  end

  def index
    @groceryitem = current_user.grocery_items
    @groceryitems = GroceryItem.search(params[:search])
    respond_to do |format|
      format.html { }
      format.js { }
    end
  end


  def edit
    @groceryitem = GroceryItem.find(params[:id])
  end

  def update
    @groceryitem = GroceryItem.find(params[:id])
      if @groceryitem.update_attributes(groceryitem_params)
       redirect_to groceryitems_path(@groceryitem)
      else
        render :edit
      end
  end

  def destroy
    @groceryitem = current_user.grocery_items
    @groceryitem.destroy
    redirect_to new_user_grocery_item_url
  end

  def sort
    @groceryitems = current_user.grocery_items
      @groceryitems.each do |groceryitem|
      groceryitem.position = params['items'].index(groceryitem.id.to_s) + 1
      groceryitem.save
    end
    render :nothing => true
  end

  private

  def groceryitem_params
    params.require(:grocery_item).permit(:item, :user_id)
  end

end
