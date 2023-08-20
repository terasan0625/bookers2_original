class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:update]
  before_action :is_matching_login_user2, only: [:edit]

  def create
  end

  def index
    @users = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books =@user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
     redirect_to user_path(@user.id)
     flash[:notice] = " You have updated user successfully."
    else
     flash.now[:notice] = "error"
     render :edit
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:profile_image, :name, :email, :introduction)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to books_path
    end
  end

  def is_matching_login_user2
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end

end
