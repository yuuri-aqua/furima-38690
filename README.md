# README

## usersテーブル

| Column             | Type       | Options                   |
| ------------------ | ---------- | ------------------------- |
| nickname           | string     | null: false               |
| email              | string     | null: false, unique: true |
| encrypted_password | integer    | null: false               |
| family_name        | integer    | null: false               |
| first_name         | integer    | null: false               |
| family_name_kana   | integer    | null: false               |
| first_name_kana    | integer    | null: false               |
| birth_date         | date       | null: false               |

### Association
- has_many :items
- has_many :purchases
- has_many :comments


## itemsテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| product_name          | string     | null: false                    |
| product_description   | text       | null: false                    |
| product_category_id   | integer    | null: false                    |
| product_condition_id  | integer    | null: false                    |
| shipping_charges_id   | integer    | null: false                    |
| prefecture_id         | integer    | null: false                    |
| days_to_ship_id       | integer    | null: false                    |
| selling_price         | integer    | null: false                    |
| user_id               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase
- has_many :comments


## purchasesテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user_id      | references | null: false, foreign_key: true |
| item_user_id | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## addressesテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_code      | integer    | null: false                    |
| prefectures_id | integer    | null: false                    |
| municipalities | string     | null: false                    |
| house_number   | string     | null: false                    |
| building _name | string     |                                |
| phone_number   | integer    | null: false                    |
| user_id        | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase


## commentsテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| text         | text       | null: false                    |
| user_id      | references | null: false, foreign_key: true |
| item_id      | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item