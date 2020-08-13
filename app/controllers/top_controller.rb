class TopController < ApplicationController
  def index
    @posts = Post.published.includes(:category).default_order.page(params[:page]).per(8)
    @slider_posts = Post.published.favorite.default_order.limit(8)
  end
  def aboutus
  end
  def contact
  end
  def link
  end
end
