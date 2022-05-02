class Bid < ApplicationRecord
  belongs_to :user
  belongs_to :taker_item, :class_name => "Item"
  belongs_to :owner_item, :class_name => "Item"
  has_many :reviews
end
