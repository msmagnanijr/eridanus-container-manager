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

  def search
    @image = @image.search('term' => image_params[:search])
    @images = @image.json
  end

  private

    def set_image
      @image = Docker::API::Image.new
    end

    def image_params
      params.permit(:repo, :tag, :search)
    end
end