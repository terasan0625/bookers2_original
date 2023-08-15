class UsersController < ApplicationController
  def create
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books =@user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
     user = User.find(params[:id])
    if user.update(user_params)
     redirect_to user_path(user.id)  
     flash[:notice] = " You have updated user successfully."
    else
     flash.now[:notice] = "error"  
     @user = User.find(params[:id])
     render :edit
    end
  end

  def destroy
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name)
  end
end
