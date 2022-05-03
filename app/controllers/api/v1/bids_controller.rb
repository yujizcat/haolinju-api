class Api::V1::BidsController < ApplicationController
  before_action :set_bid, only: [:show]

  def index
    @bids = Bid.all
    render json: @bids #Just for testing
  end

  def create
    @bid = Bid.new(bid_params)
    @bid.user = current_user
    if @bid.save
      redirect_to bids_path(@bid)
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @bid = Bid.find(params[:id])
    @bid.destroy
    redirect_to bids_path(@bid)
  end

  def accept
  end

  def decline
  end

  private

  def set_bid
    @bid = Bid.find(params[:id])
  end
end
