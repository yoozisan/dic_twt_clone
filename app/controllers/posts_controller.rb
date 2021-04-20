class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:content))
    if @post.save
      redirect_to posts_path, notice: "投稿されました。"
    else
      render :new
    end
  end

  def index
    @posts = Post.all
  end
end
