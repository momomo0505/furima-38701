## Usersテーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false , unique: true|
| encrypted_password | string  | null: false |
| first_name         | string  | null: false |
| last_name          | string  | null: false |
| first_name_kana    | string  | null: false |
| last_name_kana     | string  | null: false |
| birthday           | date    | null: false |

### Association
- has_many :items
- has_many :orders


## Itemsテーブル

| Column            | Type      | Options     |
| ----------------- | --------- | ----------- |
| name              | string    | null: false |
| description       | text      | null: false |
| category_id       | integer   | null: false |
| item_condition_id | integer   | null: false |
| shipping_charge_id| integer   | null: false |
| prefecture_id     | integer   | null: false |
| days_to_ship_id   | integer   | null: false |
| price             | integer   | null: false |
| user              | references| null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order


## Ordersテーブル

| Column        | Type      | Options     |
| ------------- | --------- | ----------- |
| user          | references| null: false, foreign_key: true |
| item          | references| null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :payment


## paymentsテーブル

| Column        | Type      | Options     |
| ------------- | --------- | ----------- |
| post_code     | string    | null: false |
| prefecture_id | integer   | null: false |
| city          | string    | null: false |
| block         | string    | null: false |
| building      | string    |
| tel           | string    | null: false |
| order         | references| null: false, foreign_key: true |


### Association
- belongs_to :order