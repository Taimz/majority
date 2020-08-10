include ApplicationHelper

class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }
  before_action :authenticate

  private

  def authenticate
    if authenticate_with_http_token { |token, options| $redis.hexists(token, 'id') && @token = token }
      @current_user = $redis.hgetall(@token).with_indifferent_access
    else
      render json: "Invalid token", status: :unauthorized
    end
  end

end
