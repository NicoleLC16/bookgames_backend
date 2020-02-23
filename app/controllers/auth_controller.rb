
class AuthController < ApplicationController
  skip_before_action :authorized, only: [:create, :show]

  # Create is a new login
    def create
      # find a user by user name and have it match with their password
      # puts "hi"
      # byebug
      # puts "bye"
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        # issue that user a token
        # token = issue_token
        # render json: {id: user.id, username: user.username, jwt: token}
        # possible issue? if this does not work, go back to code above
        render json: { user: UserSerializer.new(@user), jwt: issue_token }, status: :accepted
      else
        render json: {error: 'Invalid user or password'}, status: :unauthorized
      end
    end
  
    def show
      if logged_in?
        render json: {user: UserSerializer.new(@user), jwt: issue_token}, status: :accepted
      else
        render json: {error: 'Invalid token'}, status: :unauthorized
      end
    end
  
  
  end