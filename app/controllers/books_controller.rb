class BooksController < ApplicationController
  # newメソッドは必要ないかも
  def new
    # @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      flash.now[:alert] = "Book could not be created."
      render :index
    end
  end
  
  def index
    @books = Book.all
    @book = Book.new
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
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(book.id)
    else
      flash.now[:alert] = "Book could not be updated."
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      flash[:notice] = "Book was successfully deleted."
    else
      flash.now[:alert] = "Book could not be deleted."
    end
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
