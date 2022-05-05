class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users #Just for testing
  end

  def show
  end

  def show_nickname
    @user_nickname = User.find(params[:id]).nickname
    render json: @user_nickname
  end

  def my_items
    @user_items = @current_user.items
    p @user_items
    render json :@user_items
  end
end
