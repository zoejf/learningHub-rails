class CommentsController < ApplicationController
  def new
    @resource = Resource.find(params[:id])
    @comment = Comment.new
    if current_user
      render :new
    else
      redirect_to login_path
      flash[:error] = "You must log in to add a comment."
    end
  end

  def create
    if current_user
      comment = Comment.new(comment_params) 
      comment.user_id = session[:user_id]
      comment.resource_id = params[:id]
      if comment.save
        resource = Resource.find(comment.resource_id)
        resource.name = resource.name.gsub(' ', '%20')
        redirect_to "/resources/#{resource.name}"
      else
        flash[:error] = comments.errors.full_message.join(", ")
        redirect_to new_comment_path
      end  
    else
      redirect_to login_path
      flash[:error] = "You must log in to add a comment."
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def comment_params
      params.require(:comment).permit(:title, :body, :resource_id)
    end
end
