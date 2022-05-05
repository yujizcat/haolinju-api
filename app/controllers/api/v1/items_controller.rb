class Api::V1::ItemsController < Api::V1::BaseController
  before_action :set_item, only: [:show]

  def index
    @items = Item.all
    render json: @items #Just for testing
  end

  def create
    @item = Item.new(item_params)
    @item.user = @current_user
    if @item.save
      render json: @item
    else
      render :new
    end
  end

  def show
    render json: @item
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    render json: @item
  end

  def destroy
    begin
      # p "item found"
      @item = Item.find(params[:id])
      @item.destroy
      render json: @item
      # request.referrer
    rescue ActiveRecord::RecordNotFound => e
      # p "item not found"
    end
  end

  def myitems
  end

  def receive
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :category, :description, :condition, :image_url, :value, :request, :is_freebie, :status, :user_id)
  end
end
