class Api::V1::CompoundsController < ApplicationController
  def index
    @compounds = Compound.all
    render json: @compounds #Just for testing
  end
end
