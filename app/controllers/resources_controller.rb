class ResourcesController < ApplicationController
  def index
    @resources = Resource.all
    render :index
  end

  def new
    @resource = Resource.new
    @tags = Tag.all
    if current_user && current_user.email == 'zoe@test.com'
      render :new
    else
      redirect_to root
      flash[:error] = "You do not have permission to view this page."
    end
  end

  def create
    if current_user && current_user.email == 'zoe@test.com'
    resource = Resource.new(resource_params)
      if resource.save
        redirect_to "/resources/#{resource.name}"
      end
    else
    redirect_to root
    flash[:error] = "You do not have permission to perform this action."
    end
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

  private
  def resource_params
    params.require(:resource).permit(:name, :website, :price, :image, :description)
  end
end
