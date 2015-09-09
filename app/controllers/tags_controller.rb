class TagsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def show
    @tag = Tag.find_by_text(params[:text])
    render :show
  end

  def edit
  end

  def update
  end

  def delete
  end
end
