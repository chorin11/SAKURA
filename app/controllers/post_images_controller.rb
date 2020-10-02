class PostImagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @post_images = PostImage.order(created_at: :desc).limit(8)
    @post_total = @post_images.page(params[:page])
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
    @comments = @post_image.post_comments.order(created_at: :desc)
    @user = @post_image.user
  end

  def edit
    @post_image = PostImage.find(params[:id])
  end

  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.location = Language.get_data(post_image_params[:introduction])
    @post_image.user_id = current_user.id
    if @post_image.save
       @comment = PostComment.new
      # @post_image = PostImage.order(created_at: :desc).limit(8)
      redirect_to post_image_path(@post_image)
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

  def hashtag
    @user = current_user
    if params[:name].nil?
      @hashtags = Hashtag.all.to_a.group_by{ |hashtag| hashtag.post_images.count}
    else
      @hashtag = Hashtag.find_by(hashname: params[:name])
      @postimage = @hashtag.post_images.page(params[:page]).per(20).reverse_order
      @hashtags = Hashtag.all.to_a.group_by{ |hashtag| hashtag.post_images.count}
    end
  end
  
  def post_search
    selection = params[:keyword]
    @post_images = PostImage.sort(selection)
  end

  private
  def post_image_params
    params.require(:post_image).permit(:introduction, :image, :hashbody, :hashtag_ids, :post_comment_id)
  end

end
