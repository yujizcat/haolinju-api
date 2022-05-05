class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users #Just for testing
  end

  def show
  end

  def my_items
    @user_items = @current_user.items
    p @user_items
    render json :@user_items
  end
end
