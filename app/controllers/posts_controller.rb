class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @post = Post.all
    @user = User.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(params.require(:post).permit(:title, :body))

    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end
end
