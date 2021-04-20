class PostsController < ApplicationController
  before_action :set_post, only:[:edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, notice: "投稿されました。"
    else
      render :new
    end
  end

  def index
    @posts = Post.all
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: "編集されました。"
    else
      render :new
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "削除されました。"
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
