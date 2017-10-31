class PostsController < ApplicationController
  def new
    # fail
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.sub_id = params[:sub_id]
    if @post.save
      # fail
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def show
    @post = Post.find_by(id: params[:id])

  end

  def destroy
    post = Post.find_by(id: params[:id])
    post.destroy
    redirect_to sub_url(post.sub_id)
  end
  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
