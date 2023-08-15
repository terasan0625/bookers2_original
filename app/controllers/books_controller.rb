class BooksController < ApplicationController
  def create
    # @book = Book.new(book_params)
    @book = Book.new
    @book.user_id = current_user.id
    if @book.save
    redirect_to book_path(@book.id)
    flash[:notice] = "Book was successfully created."
    else
    @books = Book.all
    flash.now[:notice] = "error"     
    render :index
    end
  end

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
     redirect_to book_path(book.id)  
    flash[:notice] = "Book was successfully updated."
    else
    flash.now[:notice] = "error"  
     @book = Book.find(params[:id])
     render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path  
    flash[:notice] = "Book was successfully destroyed."
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
