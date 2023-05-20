class BooksController < ApplicationController


  def create
    @book  = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
       flash[:notice] = "successfully"
    else
      @books=Book.all
      render :index
    end

  end

  def index
    @books=Book.all
    @book=Book.new
  end

  def show
    @books = Book.find(params[:id])
  end

  def edit
    @books = Book.find(params[:id])
    @book=Book.new
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(book.id)
       flash[:notice] = "successfully"
    else
      @books=Book.find(params[:id])
      render :edit
    end

  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
    flash[:notice] = "successfully"
  end

  def book_params
    params.require(:book).permit(:title,:body)

  end
end
