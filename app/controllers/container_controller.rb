class ContainerController < ApplicationController
  before_action :set_container, except: [:new]
  def index
    @containers = @container.list(all: true).json
    @containers.map { | c | c["Name"] = c["Names"][0].gsub("/", "") }
  end

  def new
    image = Docker::API::Image.new
    response = image.list
    @images = response.json.map{ | r | r["RepoTags"][0] }
  end

  def create
    host_config = eval(container_params[:host_config])
    response = @container.create( {name: container_params[:name]}, {Image: container_params[:image], HostConfig: host_config })
    if response.success?
      redirect_to container_index_path
    else
      redirect_to new_container_path
    end
  end

  def start
    @container.start(params[:id])
    redirect_to container_index_path
  end

  def stop
    @container.stop(params[:id])
    redirect_to container_index_path
  end

  def destroy
    @container.remove(params[:id])
    redirect_to container_index_path
  end

  def chart
    @containers = @container.list(all: true).json
  end

  private
    def set_container
      @container = Docker::API::Container.new
    end

    def container_params
      params.permit(:name, :image, :host_config)
    end
end