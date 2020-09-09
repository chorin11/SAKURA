class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images.page(params[:id]).reverse_order
  end

  def edit
  end

  def update
  end

  def unsubscrilbe
  end

  def withdrow
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction,:image, :email, :favorite_sweets)
  end
  
end
