class ImageController < ApplicationController
  before_action :set_image
  def index
    @images = @image.list.json
  end

  def new
  end

  def create
    response = @image.create( fromImage: "#{image_params[:repo]}:#{image_params[:tag]}" )
    if response.success?
      redirect_to image_index_path
    else
      render :new
    end
  end

  def destroy
    @image.remove(params[:id])
    redirect_to image_index_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Docker::API::Image.new
    end

    # Only allow a list of trusted parameters through.
    def image_params
      params.permit(:repo, :tag)
    end
end