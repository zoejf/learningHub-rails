class ResourcesController < ApplicationController
  def index
    @resources = Resource.all
    render :index
  end

  def create
  end

  def new
  end

  def show
    @resource = Resource.find_by_name(params[:name]) 
    render :show
  end

  def edit
  end

  def update
  end

  def delete
  end
end
