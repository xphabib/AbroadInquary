class BlogsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
     @blogs = Blog.all
    @categories = Category.all
     @resent_posts = Blog.last(10)
  end

  def show
    @blog = Blog.find(params[:id])
    @categories = Category.all
    @comments = @blog.comments
    @resent_posts = Blog.last(10)
  end
end
