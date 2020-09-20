class FavoritesController < ApplicationController
  # before_action :post_image_path

  def create
    @post_image = PostImage.find(params[:post_image_id])
    favotite = current_user.favorites.new(post_image_id: params[:post_image_id])
    favotite.save
  end

  def destroy
    @post_image = PostImage.find(params[:post_image_id])
    favorite = Favorite.find_by(user_id: current_user.id, post_image_id: params[:post_image_id])
    favorite.destroy
  end

  private

  def favorite_params
    params.require(:post_image).permit(:user_id, :post_image_id)
  end
  
end
