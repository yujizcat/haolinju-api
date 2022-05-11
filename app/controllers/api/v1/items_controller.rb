class Api::V1::ItemsController < Api::V1::BaseController
  before_action :set_item, only: [:show, :upload]

  def index
    if params[:query].present?
      @items = Item.where("name ILIKE ?", "%#{params[:query]}%").map { |item| item.to_h }
    else
      if params[:cate].present?
        @items = Item.where(category: params[:cate]).map { |item| item.to_h }
      else
        @items = Item.all.map { |item| item.to_h }
      end
    end

    render json: @items #Just for testing
  end

  def create
    @item = Item.new(item_params)
    @item.user = @current_user
    @item.status = "available"
    if @item.save
      render json: @item.to_h
    else
      render :new
    end
  end

  def show
    @usernickname = @item.user.nickname
    render json: { item: @item.to_h, usernickname: @usernickname }
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    render json: @item.to_h
  end

  def destroy
    begin
      # p "item found"
      @item = Item.find(params[:id])
      @item.destroy
      render json: @item.to_h
      # request.referrer
    rescue ActiveRecord::RecordNotFound => e
      # p "item not found"
    end
  end

  def user_items
    @user_items = User.find(params[:id]).items.map { |item| item.to_h }
    render json: @user_items
  end

  def myitems
  end

  def receive
    @item = Item.find(params[:id])
    @item.status = "unavailable"
    @item.save
    render json: @item
  end

  def notreceive
    @item = Item.find(params[:id])
    @item.status = "available"
    @item.save
    render json: @item
  end

  def freebie
    @items = Item.where(is_freebie: true).map { |item| item.to_h }
    render json: @items
  end

  # def search
  #  @items = Item.where("name like ?", "%mop%")
  #  render json: @items
  # end


  def upload
    if @item.photo.attach(params.require(:file))
      render json: { msg: 'photo uploaded' }
    else
      render json: { err: 'fail to upload' }
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :category, :description, :condition, :image_url, :value, :request, :is_freebie, :status, :user_id)
  end
end
