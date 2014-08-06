# News comments controller
class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post])
    @post.comments.create(comment_params)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  def comment_params
    params.require(:comments).permit(:name, :message)
  end
end
