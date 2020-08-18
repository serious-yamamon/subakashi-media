class Admin::ApplicationController < ApplicationController
  before_action :only_admin

  def only_admin
    render_404 unless @current_writer
  end
end
