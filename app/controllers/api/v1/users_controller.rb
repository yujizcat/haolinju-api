class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users #Just for testing
  end
end
