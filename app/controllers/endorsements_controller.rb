class EndorsementsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    resource = Resource.find_by_id(endorsement_params[:resource_id])

    #check if current_user already has bookmarked this post
    if current_user.endorsements.include?(resource)
      render json: {}, status: :bad_request
    else
      @endorsement = current_user.endorsements.new(endorsement_params)
      if @endorsement.save
        render json: @endorsement
      else
        render json: { errors: @endorsement.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end

  def destroy
  end

  private
    def endorsement_params
      params.require(:endorsement).permit(:resource_id)
    end
end
