class BooksController < ApplicationController
  def new
    @book = Book.new
    @user = @book.user
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to books_path
    else
      @books = Book.all
      render :index
    end
  end

  def index
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
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to books_path
    else
      render :index
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  private

  def book_params
  params.require(:book).permit(:title, :body).merge(user_id:current_user.id)
  end

  
end
