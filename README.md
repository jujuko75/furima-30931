# README

## usersテーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false, format       |
| last_name          | string | null: false, format       |
| first_name         | string | null: false, format       |
| last_name_kana     | string | null: false, format       |
| first_name_kana    | string | null: false, format       |
| birth_date         | date   | null: false               |

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
| user            | references | null: false, foreign_key: true |

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
| item            | references | null: false, foreign_key: true | 
| user            | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one :buyer_info


## Buyer_infoテーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | string     | null: false, format            |
| prefecture_id   | integer    | null: false, ActiveHash        |
| city            | string     | null: false                    |
| house_number    | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | string     | null: false, format            | 
| purchase        | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase
- belongs_to :prefecture



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
- has_many :buyer_info
