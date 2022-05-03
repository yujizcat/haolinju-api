class Api::V1::ItemsController < ApplicationController
  before_action :set_item, only: [:show]

  def index
    @items = Item.all
    render json: @items #Just for testing
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to items_path(@item)
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path(@item)
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
    params.require(:item).permit(:name, :category, :description, :condition, :image_url, :value, :request, :freebie, :status)
  end
end
