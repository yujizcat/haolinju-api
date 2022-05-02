class Item < ApplicationRecord
  belongs_to :user
  #has_many :owner_bids, :class_name => "Bid", foreign_key => "owner_item_id"
  #has_many :taker_bids, :class_name => "Bid", foreign_key => "taker_item_id"
end
