class ToppagesController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc).page(params[:page]).per(5)
    @users = User.all
  end
end
