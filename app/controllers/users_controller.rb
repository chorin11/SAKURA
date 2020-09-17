class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images.page(params[:id]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:notice] = 'あなたの情報が更新されました。'
    redirect_to user_path(@user.id)
  end

  def unsubscrilbe
  end

  def withdrow
  end

  def search
    @user_or_post = params[:option]
    if @user_or_post =="1"
      @user =User.search(params[:search], @user_or_post)
    else
      @posts = PostImage.search(params[:search], @user_or_post)
    end
  end

  def following
    @user = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end
  
  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction,:image, :email, :favorite_sweets, :profile_image)
  end
  
end
