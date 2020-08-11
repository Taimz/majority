class Api::UsersController < ApplicationController

  skip_before_action :authenticate, only: [:create]

  # POST /api/users
  def create
    # validate
    error = invalid? user_params
    if error
      render json: json_response("Validations failed", nil, error), status: :unauthorized
      return
    end

    # create user
    user = User.create(user_params)
    @user = user.serialized

    render json: json_response("User successfully created", @user, nil)
  end

  # GET /api/users/me
  def me
    render json: {
        user: @current_user
    }
  end


  private

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:username, :password)
  end

  def invalid? params
    return "Username not present" unless params[:username].present?
    return "Password not present" unless params[:password].present?
    unless params[:password].match /\A (?=.{8,}) (?=.*\d) (?=.*[a-z]) (?=.*[A-Z]) (?=.*[[:^alnum:]]) /x
      return "Password format incorrect"
    end
    false
  end


end
