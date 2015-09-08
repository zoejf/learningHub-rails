class PagesController < ApplicationController
  def index
    @resources = Resource.all
    @tags = Tag.all
    render :index
  end

  def about
  end
end
