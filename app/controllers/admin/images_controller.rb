class Admin::ImagesController < ApplicationController
  def index
    @images = Image.all.order('created_at desc').limit(10)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      respond_to do |format|
        format.html
        format.json
      end
    else
      render json: { error: @image.errors.full_messages.join('.') }, status: :bad_request
    end
  end

  private

  def image_params
    params.permit(:image)
    #params.require(:image).permit(:image)
  end
end
