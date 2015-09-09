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
    #find endorsement entry in table by resource_id
    endorsement = current_user.endorsements.where(resource_id: params[:id])

    #if that endorsement exists, delete it
    if endorsement.any?
      endorsement.first.destroy
      render json: endorsement.first.destroy
    else
      render json: {}, status: :bad_request
    end
  end

  private
    def endorsement_params
      params.require(:endorsement).permit(:resource_id)
    end
end
