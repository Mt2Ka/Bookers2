class UsersController < ApplicationController
  def new
   @user = User.new
   @user.profile_image = current_user.profile_image
  end
  
  
  def show
    @user = User.find(params[:id])
  end
  
  def create
   @user = User.new(user_params)
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
  end

  private

  def user_params
   params.require(:user).permit(:name,:profile_image,:introduction)
  end
end

