module ExceptionResolver
  extend ActiveSupport::Concern

  INTERNAL_ERROR = 'An Internal error occurred'

  included do
    rescue_from Exception, with: :filter_exception
  end

  def filter_exception(e)
    case e
      when ActionController::ParameterMissing
        render json: {error: e.message}, status: :bad_request
      else
        render error: INTERNAL_ERROR, status: :internal_server_error
    end
  end
end