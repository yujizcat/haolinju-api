class Item < ApplicationRecord
  belongs_to :user
  # This allows to use `item.bids` to retrive all bids related to this item
  has_many :bids, :class_name => "Bid", :foreign_key => "owner_item_id"
  # has_many :taker_bids, :class_name => "Bid", :foreign_key => "taker_item_id"
end
