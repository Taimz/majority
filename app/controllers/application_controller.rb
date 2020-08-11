include ApplicationHelper

class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }
  before_action :authenticate

  private

  def authenticate
    if authenticate_with_http_token { |token, options| Rails.cache.exist?(token) && @token = token }
      user_id = Rails.cache.read(@token)
      @current_user = User[user_id.to_i].serialized
    else
      render json: "Invalid token", status: :unauthorized
    end
  end

end
