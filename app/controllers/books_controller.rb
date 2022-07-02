class BooksController < ApplicationController
  before_action :authenticate_user!


  def new
    @book = Book.new

  end

  def create
    @book = Book.new(book_params)
    @user = current_user
    @book.user_id = @user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
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
    @book2 = Book.new
    @user = @book.user

  end

  def edit
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end



  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end
