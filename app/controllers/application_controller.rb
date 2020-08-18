class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger

  before_action :set_current_writer

  def set_current_writer
    @current_writer = Writer.find_by(id: session[:writer_id])
  end

  rescue_from ActiveRecord::RecordNotFound, with: :render_404 if Rails.env.production?
  rescue_from ActionController::RoutingError, with: :render_404 if Rails.env.production?
  rescue_from Exception, with: :render_500 if Rails.env.production?

  def render_404(exception = nil)
    logger.info "Rendering 404 with exception: #{exception.message}" if exception
    render template: 'errors/error_404', status: :not_found, layout: 'application'
  end

  def render_500(exception = nil)
    logger.info "Rendering 500 with exception: #{exception.message}" if exception
    render template: 'errors/error_500', status: :internal_server_error, layout: 'application'
  end
end
