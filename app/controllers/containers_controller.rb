class ContainersController < ApplicationController
    def index
       @containers = Docker.info["ContainersRunning"].to_i
       @containers_exited = (Docker::Container.all(all: true, filters: { status: ["exited"] }.to_json)).count
    end
end