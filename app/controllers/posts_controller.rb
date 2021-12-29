class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:content))
    if @post.save
      flash[:notice] = "Post was created successfully."
      redirect_to @post
    else
      render 'new'
    end
  end

end
