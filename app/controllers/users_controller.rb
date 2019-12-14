class UsersController < ApplicationController
  skip_before_action :authenticate_request, :only => [:authenticate]

  def authenticate
    command = AuthenticateUser.call(params[:email], params[:password])

    if command.success?
      render json: { auth_token: command.result }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end

  def show_user
    if @current_user
      render json: { user: @current_user, status: 200}
    else
      render json: { error: "Something went wrog", status: 403 }
    end
  end

end
