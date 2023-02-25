## Usersテーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| nickname      | string  | null: false |
| email         | string  | null: false |
| password      | string  | null: false |
| first_name1   | string  | null: false |
| last_name1    | string  | null: false |
| first_name2   | string  | null: false |
| last_name1    | string  | null: false |
| birthday      | date    | null: false |

### Association
- has_many :items
- has_many :orders


## Itemsテーブル

| Column        | Type      | Options     |
| ------------- | --------- | ----------- |
| name          | string    | null: false |
| text          | text      | null: false |
| price         | integer   | null: false |

### Association
- belong_to :user
- has_one :order


## Ordersテーブル

| Column        | Type      | Options     |
| ------------- | --------- | ----------- |
| user_id       | references| null: false, foreign_key: true |
| item_id       | references| null: false, foreign_key: true |

### Association
- belong_to :user
- belong_to :item
- has_one :payment


## paymentテーブル

| Column        | Type      | Options     |
| ------------- | --------- | ----------- |
| order_id      | references| null: false, foreign_key: true |
| post_code     | integer   | null: false |
| prefecture    | string    | null: false |
| city          | string    | null: false |
| block         | string    | null: false |
| building      | string    |
| tel           | integer   | null: false |

### Association
- belong_to :order