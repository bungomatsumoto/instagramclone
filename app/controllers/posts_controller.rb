class PostsController < ApplicationController
  before_action :get_id_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def confirm
    @post = current_user.posts.build(post_params)
    # ログイン中のユーザーの、postを、build(new)する
    render :new if @post.invalid?
  end

  def create
    @post = current_user.posts.build(post_params)
    # ログイン中のユーザーの、postを、build(new)する
    if params[:back]
      render :new
    else
      if @post.save
        redirect_to posts_path, notice: "投稿しました"
      else
        render :new
      end
    end
  end

  def show
    @favorite = current_user.favorites.find_by(post_id: @post.id)
  end

  def edit
  end

  def update
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
    params.require(:post).permit(:user_id, :content, :image, :image_cache)
  end

  def get_id_post
    @post = Post.find(params[:id])
  end
end
