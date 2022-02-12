class BooksController < ApplicationController

  def index
     @book = Book.new
     @books = Book.all
     @user = User.find(current_user.id)



  end

  def show
     @book = Book.new
     @books = Book.find_by(id: params[:id])
     @user = User.find_by(id: @books.user_id)

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
