class PostsController < ApplicationController
  before_action :get_id_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to posts_path, notice: "投稿しました"
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
      redirect_to posts_path, notice: "投稿を編集しました"
    else
      render :edit
    end

    def destroy
      @post.destroy
      redirect_to posts_path "投稿を削除しました"
    end

  end

  private

  def post_params
    params.require(:post).permit(:content, :image)
  end

  def get_id_post
    @post = Post.find(paramns[:id])
  end
end
