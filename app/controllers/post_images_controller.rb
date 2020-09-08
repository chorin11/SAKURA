class PostImagesController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def new
    @post_image = PostImage.new
  end

  def create
    post_image = PostImage.new(post_image_params)
    post_image.save
    redirect_to post_images_path
  end

  def update
  end

  def destroy
  end
  
  private
  def post_image_params
    params.require(:post_image).permit(:introduction, :image)
  end

end
