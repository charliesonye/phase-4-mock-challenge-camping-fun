class CampersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :error_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :error_not_valid_response
    
    def index
        campers = Camper.all
        render json: campers
    end

    def show
        camper = Camper.find(params[:id])
        render json: camper, serializer: CamperWithActivitiesSerializer
    end

    def create
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
    end

    private

    def error_not_found_response
        render json: {error: "Camper not found"}, status: :not_found
    end

    def error_not_valid_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end
   


    def camper_params
        params.permit(:name, :age)
    end

end
