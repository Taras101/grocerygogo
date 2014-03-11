class ListsController < ApplicationController
  before_filter :not_authenticated
  def new
    @list = List.new
    @lists = List.search(params[:search])
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to new_list_url
    else
      render :new
    end
  end

  def show
    @list = List.find(params[:id])
  end

  def index
    @list = current_user.list
    @lists = List.search(params[:search])

    respond_to do |format|
      format.html { }
      format.js { }
    end
  end


  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
      if @list.update_attributes(list_params)
       redirect_to lists_path(@list)
      else
        render :edit
      end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to new_list_url
  end

  private

  def list_params
    params.require(:list).permit(:item, :user_id)
  end

end
