class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update, :destroy]
  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.save 
    redirect_to books_path
  end

  def edit
  end

  def update
    @book.update(book_params)

    redirect_to book_path(@book)
  end

  def destroy
    @book.destroy 
    redirect_to books_path
  end

  private 

  def find_book 
    @book = Book.find_by_id(params[:id])
  end

  def book_params 
    params.require(:book).permit(:name, :title, :user_id)
  end
end
