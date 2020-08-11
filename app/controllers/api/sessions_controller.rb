class Api::SessionsController < ApplicationController

  skip_before_action :authenticate, only: [:create]

  # POST /api/login
  def create
    @user = User.find({username: params[:username]}).first
    if @user.present?
      if @user.password_valid? params[:password]
        token = @user.generate_token
        Rails.cache.write(token, @user.id)
        render json: json_response("User successfully authenticated", @user, nil, token)
      else
        render json: json_response("Authentication failed", nil, "Incorrect password"), status: :unauthorized
      end
    else
      render json: json_response("Authentication failed", nil, "User does not exist"), status: :unauthorized
    end
  end

  # DELETE /api/logout
  def destroy
    Rails.cache.delete(@token)
    render json: json_response("User successfully logged out", nil, nil)
  end

end
