class PostsController < ApplicationController
  def new

  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.sub_id = sub_id
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
