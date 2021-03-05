class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end


  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to current_user
    else
      redirect_to "/"
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end

  def destroy
    @post.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def post_params
    params.require(:post).permit(:category, :title, :material, :content)
  end
end
