class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture, :municipalities, :house_number, :building_name, :phone_number

  with_options presence: true do
    validates :municipalities
    validates :house_number
    validates :item_id
    validates :user_id
    validates :postal_code,  format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: 'is invalid.' }
  end
    validates :prefecture, numericality: {other_than: 1, message: "can't be blank"}
    ### 個人用メモ：prefecture か prefecture_id か後ほど検証する
  
  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
      
    Address.create(postal_code: postal_code, prefecture: prefecture, municipalities: municipalities, house_number: house_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end

end