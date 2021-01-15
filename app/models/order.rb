class Order < ApplicationRecord
  belongs_to :order
  validates :price, presence: true
end
