class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save

      redirct_to posts_path, notice: "投稿しました"
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirct_to posts_path, notice: "投稿を編集しました"
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :image)
  end
end
