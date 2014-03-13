class UsersController < ApplicationController
    def index
    @user = current_user
  end

  def show

   @user = User.find(params[:id])
   @groceryitems = @user.grocery_items
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login @user
      @user = current_user
      redirect_to user_grocery_items_path(@user.id) , :notice => "Signed Up!"
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end
end

private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

