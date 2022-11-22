FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)}
    password_confirmation {password}
    family_name           {'名字'}
    first_name            {'名前'}
    family_name_kana      {'ミョウジ'}
    first_name_kana       {'ナマエ'}
    birth_date            {Faker::Date.between(from: '1930-01-01', to: '2017-12-31')}

  end
end