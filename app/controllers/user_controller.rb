class UserController < ApplicationController
  def show
    @user = User.new
    @post_images = @user.post_images
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update
    redirect_to user_path
  end
  
  def index
    @user = User.new
    @users = User.all
  end
  
 private
 
def user_params
   params.require(:user).permit(:name,:profile_image,)
end

  
end
