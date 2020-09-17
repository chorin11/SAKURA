class PostCommentsController < ApplicationController
  def create
    @post_image = PostImage.find(params[:post_image.id])
    @comment = @post_image.comments.build(post_comment_params)
    @comment.post_image_id = current_user.id
    @comment.save
    render :index
  end

  def destroy
    @comment = PostComment.find(params[:id])
    @comment.destroy
    render :index
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:post_comment, :post_image_id, :user_id)
  end
end
