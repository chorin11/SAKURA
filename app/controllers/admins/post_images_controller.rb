class Admins::PostImagesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_admin

  def index
    @post_images = PostImage.all.order(created_at: :desc)
    @post_images = PostImage.page(params[:page]).per(10)
  end

  def show
    @post_image = PostImage.find(params[:id])
  end
  
  private

  def set_admin
    @admin = current_admin
  end

  def post_image_params
    params.require(:post_image).permit(:user_id, :image_id, :introduction, :hashbody)
  end

end
