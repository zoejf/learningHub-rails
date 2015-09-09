class BookmarksController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    resource = Resource.find_by_id(bookmark_params[:resource_id])

    #check if current_user already has bookmarked this post
    # if current_user.bookmarks.where(resource_id: resource.id).any?
    if current_user.resources.include?(resource)
      render json: {}, status: :bad_request
    else  
      @bookmark = current_user.bookmarks.new(bookmark_params)
      p "inside create"
      if @bookmark.save
        render json: @bookmark
      else
        p "else"
        render json: { errors: @bookmark.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end

  def destroy
    
  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:resource_id)
  end
end
