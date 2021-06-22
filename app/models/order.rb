class Order < ApplicationRecord
  enum payment_method: {クレジットカード: 0, 銀行振込: 1}

  has_many :order_items, dependent: :destroy
  belongs_to :customer
end
