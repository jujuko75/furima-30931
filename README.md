# README

## usersテーブル
| Column          | Type   | Options             |
| --------------- | ------ | ------------------- |
| nickname        | string | null: false         |
| email           | string | null: false, format |
| password        | string | null: false, format |
| last_name       | string | null: false, format |
| first_name      | string | null: false, format |
| last_name_kana  | string | null: false, format |
| first_name_kana | string | null: false, format |
| birth_date      | data   | null: false         |

### Association
- has_many :items
- has_many :purchases



## Itemsテーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| text            | text       | null: false                    |
| price           | integer    | null: false                    |
| category_id     | integer    | null: false ,ActiveHash        |
| condition_id    | integer    | null: false ,ActiveHash        |
| postagetype_id  | integer    | null: false ,ActiveHash        | 
| prefecture_id   | integer    | null: false ,ActiveHash        | 
| deliverydays_id | integer    | null: false ,ActiveHash        | 
| user_id         | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :category
- belongs_to :condition
- belongs_to :postagetype
- belongs_to :prefecture
- belongs_to :deliverydays
- has_one :purchase



## Purchasesテーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | integer    | null: false, format            |
| prefecture_id   | integer    | null: false, ActiveHash        |
| city            | string     | null: false                    |
| house_number    | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | integer    | null: false, format            | 
| item_id         | references | null: false, foreign_key: true | 
| user_id         | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user


## Category
### Association
- has_many :items

## Condition
### Association
- has_many :items

## postagetype
### Association
- has_many :items

## deliverydays
### Association
- has_many :items

## prefecture
### Association
- has_many :items
- has_many :purchases
