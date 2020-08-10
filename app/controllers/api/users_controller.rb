class Api::UsersController < ApplicationController

  skip_before_action :authenticate, only: [:create]

  # POST /api/users
  def create
    @user = User.create(user_params)
    # handle validation errors
    if @user.errors.present?
      render json: json_response("Validations failed", nil, @user.errors.full_messages[0]), status: :bad_request && return
    end
    session[:user_id] = @user.id

    render json: json_response("User successfully created", @user, nil)
  end

  # GET /api/users/{:id}
  def show
    render json: {
        user: @current_user
    }
  end


  private

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:username, :password)
    end


end