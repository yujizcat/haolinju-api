class Api::V1::ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end
end
