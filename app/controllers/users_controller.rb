class UsersController < ApplicationController
    def index
    @user = current_user
  end

  def show
   @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @users = User.new(user_params)

      if @users.save
        redirect_to new_list_url, :notice => "Signed Up!"
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
    params.require(:user).permit(:email, :password, :salt)
  end

