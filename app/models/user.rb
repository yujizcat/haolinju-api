class User < ApplicationRecord
  belongs_to :compound
  has_many :items
  has_many :bids
  has_many :reviews
end
