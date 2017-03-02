class ApplicationController < ActionController::API
  include ExceptionResolver
  include ActionController::Serialization

  def verify_params(param_list)
    final_params = Array.wrap(param_list)
    final_params.each {|p| params.require(p)}
  end
end
