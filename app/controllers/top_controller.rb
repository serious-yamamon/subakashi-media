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

  def sign_in
  end

  def login
    @writer = Writer.find_by(code: params[:code], pass: params[:pass])
    if @writer
      session[:writer_id] = @writer.id
      flash[:notice] = "ログインしました"
      redirect_to("/")
    else
      @error_message = "ユーザー名またはパスワードが間違っています．"
      @writer_code = params[:code]
      @pass = params[:pass]
      render("top/sign_in")
    end
  end

  def logout
    session[:writer_id] = nil
    flash[:notice] = "ログアウトしました．"
    redirect_to("/")
  end

end
