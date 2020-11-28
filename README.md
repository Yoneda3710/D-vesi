# README

## customer テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
### Association
- has_many :items
- has_many :orders

## producer テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| prefectures_id   |integer | null:false  |
| municipality     | string | null:false  |
| address          | string | null: false |
| building         | string |             |
| phone_number     | string | null: false |
### Association
- has_many :items
- has_many :orders

## items テーブル

| Column        | Type          | Options                        |
| ------------- | ------------- | ------------------------------ |
| name          | string        | null: false                    |
| description   | text          | null: false                    |
| price         | integer       | null: false                    |
| user          | references    | null: false, foreign_key: true | 
### Association
- belongs_to :customer
- belongs_to :producer
- has_one :order

## address テーブル

| Column           | Type       | Options                          |
| ---------------- | ---------- | -------------------------------- |
| postal_code      | string     | null: false                      |
| prefectures_id   | integer    | null: false                      |
| municipality     | string     | null: false                      |
| address          | string     | null: false                      |
| building         | string     |                                  |
| phone_number     | string     | null: false                      |
| order            | references | null: false, foreign_key: true   |
### Association
- belongs_to :order


## orders テーブル

| Column        | Type    | Options                                |
| ------------- | ------- | -------------------------------------- |
| user             | references | null; false, foreign_key: true   |
| item             | references | null: false, foreign_key: true   |
### Association
- belongs_to :customer
- belongs_to :producer
- belongs_to :item
- has_one :address