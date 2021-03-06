class UsersController < ApplicationController
  before_action :get_id_user, only: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
    # @user = User.find(params[:id])
  end

  def edit
    # @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to new_session_path, notice: "ログインしてください"
    end
  end

  def update
    # @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar, :avatar_cache)
  end

  def get_id_user
    @user = User.find(params[:id])
  end

end
