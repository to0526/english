class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @post = find(params[:id])
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
