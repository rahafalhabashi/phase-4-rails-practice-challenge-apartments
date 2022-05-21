class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :record_not_valid_response

  def render_not_found_response(invalid)
    render json: { error: "#{invalid.model} not found" }, status: :not_found
  end

  def record_not_valid_response(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :not_found
  end
end
