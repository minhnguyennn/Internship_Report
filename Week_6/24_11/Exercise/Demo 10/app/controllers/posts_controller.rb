class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  def create
    post = Post.create! params.require(:post).permit(:title, :content)
    redirect_to post
  end
end
