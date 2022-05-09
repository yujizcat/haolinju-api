class Api::V1::BidsController < Api::V1::BaseController
  before_action :set_bid, only: [:show]

  def index
    @bids = Bid.all
    render json: @bids #Just for testing
  end

  def create
    @bid = Bid.new(bid_params)
    @bid.user = @current_user
    @bid.save
    if  render json: @bid
    else
      render :new
    end
  end

  def show
    render json: @bid
  end

  def destroy
    begin
      @bid = Bid.find(params[:id])
      @bid.destroy
      render json: @bid
    rescue ActiveRecord::RecordNotFound => e
    end
  end

  def accept
  end

  def decline
  end

  private

  def set_bid
    @bid = Bid.find(params[:id])
  end

  def bid_params
    params.require(:bid).permit(:note, :status, :user_id, :owner_item_id, :taker_item_id)
  end
end
