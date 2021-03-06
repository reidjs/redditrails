class CommentsController < ApplicationController

  def new

  end

  def show
    @comment = Comment.find_by(id: params[:id])
    # fail
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = params[:post_id]
    @comment.parent_comment_id = params[:parent_comment_id] if params[:parent_comment_id]
    # fail
    @comment.save
    flash[:errors] = @comment.errors.full_messages
    #how do I redirect back to the post? Without using @comment object
    post = Post.find_by(id: params[:post_id])
    redirect_to post_url(post)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :parent_comment_id)
  end
end
