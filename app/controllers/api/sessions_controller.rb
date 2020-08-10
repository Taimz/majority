class Api::SessionsController < ApplicationController

  skip_before_action :authenticate, only: [:create]

  # POST /api/login
  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      # set token
      token = @user.generate_token
      $redis.hmset(token, 'id', @user.id, 'username', @user.username)

      render json: json_response("User successfully authenticated", @user, nil, token)
    else
      # can separate username and password errors based on whether a user is found or not. depends on requirements.
      render json: json_response("Authentication Failed", nil, "Invalid username or password"), status: :unauthorized
    end
  end

  # DELETE /api/logout
  def destroy
    $redis.del(@token)

    render json: json_response("User successfully logged out", nil, nil)
  end

end
