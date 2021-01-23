# DB設計
pk = public_key
fk = foreign_key
dv = devise
ah = active_hash

※ER図省略
Point 機能の流れを考える！
ユーザーを登録する→商品を出品する→商品を購入する→配送先を決める

## users table
| Column                 | Type   | Options                   |
| ---------------------- | ------ | ------------------------- |
| id(pk)                 |        |                           |
| nickname               | string | null: false, unique: true |
| email(dv)              | string | null: false, unique: true |
| encrypted_password(dv) | string | null: false               |
| first_name             | string | null: false               |
| last_name              | string | null: false               |
| first_name_kana        | string | null: false               |
| last_name_kana         | string | null: false               |
| birth_date             | date   | null: false               |

### Association
- has_many items
- has_many purchases


## items table
| Column                     | Type    | Options                 |
| -------------------------- | ------- | ----------------------- |
| id(pk)                     |         |                         |
| name                       | string  | null:false              |
| price                      | integer | null:false              |
| info                       | text    | null:false              |
| scheduled_delivery_id(ah)  | integer | null:false              |
| shipping_fee_status_id(ah) | integer | null:false              |
| prefecture_id(ah)          | integer | null:false              |
| sales_status_id(ah)        | integer | null:false              |
| category_id(ah)            | integer | null: false             |
| user_id(fk)                | integer | foreingn_key: true      |

### Association
- belongs_to user
- has_one purchase



## purchases table
| Column      | Type    | Options           |
| ----------- | ------- | ----------------- |
| id(pk)      |         |                   |
| user_id(fk) | integer | foreign_key: true |
| item_id(fk) | integer | foreign_key: true |


### Association
- belongs_to user
- belongs_to item
- has_one address



## addresses table
| Column                     | Type    | Options                 |
| -------------------------- | ------- | ----------------------- |
| id(pk)                     |         |                         |
| postal_code                | string  | null:false              |
| prefecture                 | integer | null:false              |
| city                       | string  | null:false              |
| address                    | string  | null:false              |
| building	                 | string  |                         |
| phone_number               | integer | null:false              |
| purchase_id(fk)            | integer | foreign_key:true        |

### Association
- belongs_to purchase







