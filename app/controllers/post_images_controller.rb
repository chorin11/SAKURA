class PostImagesController < ApplicationController
  def index
    @post_images = PostImage.order(created_at: :desc).limit(8)
    @post_total = @post_images.page(params[:page])
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
    @comments = @post_image.comments.order(created_at:desc)
  end

  def edit
    @post_image = PostImage.find(params[:id])
  end

  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save
       @comment = PostComment.new
      # @post_image = PostImage.order(created_at: :desc).limit(8)
      render :show
    else
      render :new
    end
  end

  def update
    post_image = PostImage.find(params[:id])
    post_image.update(post_image_params)
    redirect_to post_image_path(post_image)
  end

  def destroy
    post_image = PostImage.find(params[:id])
    post_image.destroy
    redirect_to post_images_path
  end
  
  private
  def post_image_params
    params.require(:post_image).permit(:introduction, :image)
  end

end
