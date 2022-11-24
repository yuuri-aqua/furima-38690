FactoryBot.define do
  factory :item do
    product_name         { Faker::Lorem.sentence}
    product_description  { Faker::Lorem.sentence}
    product_category_id  { Faker::Number.between(from: 2, to: 11) }
    product_condition_id { Faker::Number.between(from: 2, to: 7) }
    shipping_charge_id   { Faker::Number.between(from: 2, to: 3) }
    prefecture_id        { Faker::Number.between(from: 2, to: 48) }
    days_to_ship_id      { Faker::Number.between(from: 2, to: 4) }
    selling_price        { Faker::Number.between(from: 300, to: 9999999) }

    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
