#  app/controller/api/v1/base_controller.rb

class Api::V1::BaseController < ApplicationController
  # before_action :ensure_json_request
  # before_action :verify_token!
  # skip_before_action :verify_authenticity_token

  def render_not_found
    render_errors([{ code: '5', message: 'Resource not found' }], :not_found)
  end

  private

  def ensure_json_request
    return if request.format == :json
    request.format.symbol == :json
    render_errors([{ code: '1', message: 'Requests need to be in JSON format.'}], :not_acceptable)#406
  end

  def verify_token!
    unless params[:token] == 'secretkey'
      render_errors([{ code: '2', message: 'Unauthorized'}], :unauthorized)#401
    end
  end

  def render_errors(errors=[], status=:ok)
    render json: { errors: errors }, status: status
  end
end
