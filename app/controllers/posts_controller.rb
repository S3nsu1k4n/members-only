class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @post = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path
    else
      flash.now[:alert] = 'Failed to save post'
      render :new, status: 422
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
