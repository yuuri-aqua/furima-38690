FactoryBot.define do
  factory :purchase_address do
    item_id        { Faker::Number.non_zero_digit }
    post_code      { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    prefecture_id  { Faker::Number.between(from: 2, to: 48) }
    municipalities { '東京都' }
    house_number   { '1-1' }
    building_name  { '東京ハイツ' }
    phone_number   { Faker::Number.leading_zero_number(digits: 10) }
    token          { 'tok_abcdefghijk00000000000000000' }
  end
end
