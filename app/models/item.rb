class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy
  belongs_to :genre
  attachment :image

  def add_tax_price
    (price * 1.1).round
  end
end
