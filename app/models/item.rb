class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :product_category
  belongs_to :product_condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :days_to_ship

  validates :product_name,         presence: true
  validates :product_description,  presence: true
  validates :product_category_id,  numericality: { other_than: 1 , message: "can't be blank" } 
  validates :product_condition_id, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :shipping_charge_id,   numericality: { other_than: 1 , message: "can't be blank" } 
  validates :prefecture_id,        numericality: { other_than: 1 , message: "can't be blank" } 
  validates :days_to_ship_id,      numericality: { other_than: 1 , message: "can't be blank" } 
  validates :selling_price,        presence: true

  validates :image, presence: true

end
