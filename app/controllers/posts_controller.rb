class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
    if params[:category]
      @posts = Post.where(category: params[:category])
    else
      @posts = Post.all
    end
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
