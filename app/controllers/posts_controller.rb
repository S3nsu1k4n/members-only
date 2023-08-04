class PostsController < ApplicationController
  def index
    @post = Post.all
    @user = User.find(2)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @user = User.find(2)
    @post = @user.posts.build
    p @user
  end

  def create
    @post = User.find(2).posts.build(post_params)
    if @post.save
      redirect_to root_path
    else
      flash.now[:alert] = 'Failed to save post'
      render :new, status: 422
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render edit: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
