class BlogController < ApplicationController
  def index
    @blogs = Blog.order("created_at desc")
  end
end
