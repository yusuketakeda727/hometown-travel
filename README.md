# README DB 設計

## users table

| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| nickname           | string     | null: false                    |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |
| birthday           | date       | null: false                    |
| first_name         | string     | null: false                    |
| last_name          | string     | null: false                    |
| first_name_kana    | string     | null: false                    |
| last_name_kana     | string     | null: false                    |


### Association

- has_many :items
- has_many :orders

## items table

| Column        | Type           | Options                        |
|---------------|----------------|--------------------------------|
| user          | references     | null: false, foreign_key: true |
| title         | string         | null: false                    |
| text          | text           | null: false                    |
| price         | integer        | null: false                    |
| category_id   | integer        | null: false                    |
| status_id     | integer        | null: false                    |
| cost_id       | integer        | null: false                    |
| prefecture_id | integer        | null: false                    |
| response_id   | integer        | null: false                    |

### Association

- belongs_to :user
- has_one :order

## orders table

| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| item            | references | null: false, foreign_key: true |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## address table

| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| order         | references | null: false, foreign_key: true |
| postal_cord   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |

### Association

- belongs_to :order