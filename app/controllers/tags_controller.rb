class TagsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def show
    @tag = Tag.find(params[:id])
    render :show
  end

  def edit
  end

  def update
  end

  def delete
  end
end
