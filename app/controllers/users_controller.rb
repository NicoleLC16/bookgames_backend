class UsersController < ApplicationController
  # skip_before_action :authorized, only: [:index, :create, :show]
  def index 
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render :json => @user
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      render json: { user: UserSerializer.new(@user), jwt: issue_token}, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end
 
  private
  def user_params
    params.require(:user).permit(:name, :username, :password)
  end
end
