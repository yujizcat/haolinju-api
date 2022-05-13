class Api::V1::BidsController < Api::V1::BaseController
  before_action :set_bid, only: [:show]

  def index
    if params[:user_id].present?
      @user = User.find(params[:user_id])
      @bids = @user.bids
    elsif params[:item_id].present?
      @item = Item.find(params[:item_id])
      @bids = @item.bids
    end
    @bids_and_items = @bids.map do |bid|
      { bid: bid, owner_item: bid.owner_item.to_h, taker_item: bid.taker_item.to_h }
    end
    render json: @bids_and_items #Just for testing
  end

  def create
    p "create"
    @current_user.phone_number = params["phone_number"]
    @current_user.save
    @bid = Bid.new(bid_params)
    @bid.user = @current_user
    @bid.status = "pending"
    @bid.save
    if @bid.save
      p "saved"
      render json: @bid
    else
      p "not saved"
      render json: { message: "not saved" }
    end
  end

  def show
    render json: @bid
  end

  def new
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
    @bid = Bid.find(params[:id])
    @bid.status = "accepted"
    @bid.save
    render json: @bid
  end

  def decline
    @bid = Bid.find(params[:id])
    @bid.status = "declined"
    @bid.save
    render json: @bid
  end

  def pending
    @bid = Bid.find(params[:id])
    @bid.status = "pending"
    @bid.save
    render json: @bid
  end

  private

  def set_bid
    @bid = Bid.find(params[:id])
  end

  def bid_params
    params.require(:bid).permit(:note, :status, :user_id, :owner_item_id, :taker_item_id )
  end
end
