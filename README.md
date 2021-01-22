# README

D-vesi
====

Overview

"D-vesi" は飲食店や一般ユーザーが、小売店を介さずに生産者から直接野菜や商品を購入できるサービスです。

## Description
ユーザー側は珍しい、市場の規格に合わない等の商品を適正な値段で購入することができ、生産者側においては自社製品のアピールや規格外製品のロス削減につなげることができます。
## VS. 
生産者にプロフィール登録を求めることにより、他のサービスよりも製品の安全性や強みをアピールしやすく、同時に継続的購入に繋がりやすい仕様になっております。


## Author
*米田昌貴
*yoneda0518.icloud.com
[Yoneda3710](https://d-vesi.herokuapp.com/)

## customer テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| kana_family_name | string | null: false |
| kana_first_name  | string | null: false |
| birthday         | date   | null: false |
### Association
- has_many :items
- has_many :orders

## producer テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| family_name      | string | null: false |
| first_name       | string | null: false |
| kana_family_name | string | null: false |
| kana_first_name  | string | null: false |
| birthday         | date   | null: false |
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
| producer          | references    | null: false, foreign_key: true |
| customer          | references    | null: false, foreign_key: true | 
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