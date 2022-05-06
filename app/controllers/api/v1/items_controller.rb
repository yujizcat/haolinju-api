class Api::V1::ItemsController < Api::V1::BaseController
  before_action :set_item, only: [:show]

  def index
    if params[:query].present?
      @items = Item.where("name ILIKE ?", "%#{params[:query]}%")
    else
      if params[:cate].present?
        @items = Item.where(category: params[:cate])
      else
        @items = Item.all
      end
    end

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
    @usernickname = @item.user.nickname
    render json: { item: @item, usernickname: @usernickname }
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

  def user_items
    @user_items = User.find(params[:id]).items
    render json: @user_items
  end

  def myitems
  end

  def receive
  end

  def freebie
    @items = Item.where(is_freebie: true)
    render json: @items
  end

  # def search
  #  @items = Item.where("name like ?", "%mop%")
  #  render json: @items
  # end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :category, :description, :condition, :image_url, :value, :request, :is_freebie, :status, :user_id)
  end
end
