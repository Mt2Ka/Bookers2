class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_post,only: [:edit,:update,:destroy]

  def new
   @user = User.new
  end


  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def create
   @user = User.new(user_params)
   @user = current_user
   @user.save
   redirect_to user_path(current_user.id)
  end


  def edit
    @user = User.find(params[:id])

  end

  def update
    @user = User.find(params[:id])
    @user.id = current_user.id
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def index
    @user = User.new
    @users = User.all
    @user = current_user
    @books = @user.books
    @book = Book.new
    @books = Book.all
  end

  def correct_post
      @user = User.find(params[:id])
    unless user_signed_in? && (current_user.id == @user.id)
      redirect_to root_path
    end
  end

  private

  def user_params
   params.require(:user).permit(:name,:profile_image,:introduction)
  end
end

