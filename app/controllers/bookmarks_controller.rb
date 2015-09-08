class BookmarksController < ApplicationController
  def create
    resource = Resource.find_by_id(bookmark_params[:resource_id])

    #check if current_user already has favorited this post
    if current_user.bookmarks.include?(resource)
      render json: {}, status: :bad_request
    else  
      @bookmark = current_user.bookmarks.new(bookmark_params)
      if @bookmark.save
        render json: @bookmark
      else
        render json: { errors: @bookmark.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end

  private
  def bookmark_params
    params.require(:favorite).permit(:resource_id)
  end
end
