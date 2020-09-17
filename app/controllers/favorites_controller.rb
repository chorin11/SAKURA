class FavoritesController < ApplicationController
  before_action :post_image_params

  def create
    post_image = PostImage.find(params[:post_image_id])
    favotite = current_user.favorites.new(post_image_id: @post_image.id)
    favotite.save
  end

  def destroy
    post_image = PostImage.find(params[:post_image_id])
    @favorite = favorites.find_by(user_id: current_user.id, post_image_id: @post_image.id).deestroy
  end

  private
  def post_image_params
    @post_image = PostImage.find(params[:post_image_id])
  
end
