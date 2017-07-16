module ExceptionResolver
  extend ActiveSupport::Concern

  INTERNAL_ERROR = 'An Internal error occurred'

  included do
    rescue_from Exception, with: :filter_exception
  end

  def filter_exception(e)
    case e
      when ActionController::ParameterMissing
        render json: {errors: [{detail: e.message}]}, status: :bad_request
      when ActiveRecord::RecordInvalid
        error_objects = e.record.errors.full_messages.map{|msg| {detail: msg}}
        render json: {errors: error_objects}, status: :unprocessable_entity
      else
        render error: INTERNAL_ERROR, status: :internal_server_error
    end
  end
end