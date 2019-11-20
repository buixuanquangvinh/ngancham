class ApiController < ActionController::Base
    skip_before_action :verify_authenticity_token
    #before_action :authenticate_user!
    rescue_from Exception, with: :errorResponse

    def errorResponse(exception)
        case exception.class
        when ActiveRecord::RecordNotFound
            render json: { message: exception.message }, status: :not_found
        when ActiveRecord::RecordInvalid
            render json: { message: exception.message }, status: :unprocessable_entity
        else
            render json: { message: exception.message }, status: :internal_server_error
        end
    end

end
