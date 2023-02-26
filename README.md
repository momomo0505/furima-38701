## Usersテーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false , unique: true|
| encrypted_password | string  | null: false |
| first_name1        | string  | null: false |
| last_name1         | string  | null: false |
| first_name2        | string  | null: false |
| last_name2         | string  | null: false |
| birthday           | date    | null: false |

### Association
- has_many :items
- has_many :orders


## Itemsテーブル

| Column         | Type      | Options     |
| -------------- | --------- | ----------- |
| name           | string    | null: false |
| description    | string    | null: false |
| category       | string    | null: false |
| item_condition | string    | null: false |
| shipping charge| string    | null: false |
| prefecture     | string    | null: false |
| days_to_ship   | string    | null: false |
| price          | integer   | null: false |
| user           | references| null: false, foreign_key: true |

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
| order         | references| null: false, foreign_key: true |
| post_code     | integer   | null: false |
| prefecture    | string    | null: false |
| city          | string    | null: false |
| block         | string    | null: false |
| building      | string    |
| tel           | string    | null: false |
| order         | references| null: false, foreign_key: true |


### Association
- belongs_to :order