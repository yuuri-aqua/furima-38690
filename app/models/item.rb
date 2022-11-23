class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :product_name,         presence: true
  validates :product_description,  presence: true
  validates :product_category_id,  presence: true
  validates :product_condition_id, presence: true
  validates :shipping_charge_id,   presence: true
  validates :prefecture_id,        presence: true
  validates :days_to_ship_id,      presence: true
  validates :selling_price,        presence: true

  validates :image, presence: true

end
