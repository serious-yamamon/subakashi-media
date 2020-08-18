class Admin::SeriesController < ApplicationController
  def index
    @series = Series.all
  end

  def show
    @series = Series.find_by(id: params[:id])
    @posts = @series.posts.includes(:series).default_order.page(params[:page]).per(8)
  end

  def edit
    @series = Series.find_by(id: params[:id])
  end

  def update
    @series = Series.find_by(id: params[:id])
    @series.name = params[:name]
    @series.description = params[:description]
    @series.save
    redirect_to admin_series_index_path
  end

  def create
    @series = Series.new(name: params[:name], description: params[:description])
    @series.save
    redirect_to admin_series_index_path
  end

  def destroy
    @series = Series.find_by(id: params[:id])
    @series.destroy
    redirect_to admin_series_index_path
  end
end
