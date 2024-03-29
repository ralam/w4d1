class UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render(
        json: @user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  # def edit
  # end
  #
  # def new
  # end

  def update
    @user = User.find(params[:id])
    p @user
    if @user.update(user_params)
      render json: @user
    else
      render(
        json: @user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit([:name, :email])
  end
end
