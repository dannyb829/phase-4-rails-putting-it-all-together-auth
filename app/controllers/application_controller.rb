class ApplicationController < ActionController::API
  include ActionController::Cookies
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
  
  private 

  def record_invalid
    render json: {error: Invalid.errors.full_messages}, status: 422
  end
  
end
