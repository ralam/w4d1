class UsersController < ApplicationController

  def index
    render json: params[:some_category]
  end

  def show
  end

  def create
    render text: "Created!"
  end

  def edit
  end

  def new
  end

  def update
  end

  def destroy
  end
end
