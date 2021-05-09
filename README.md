# 研究室備品管理アプリ
## アプリの概要
研究室内の備品データの管理と、備品の貸出・返却の管理ができるアプリです。
効率的に精度良く備品データを管理し、さらに備品の貸出状況を簡単に確認することができます。

<img width="1200" alt="スクリーンショット 2021-05-08 19 21 03" src="https://user-images.githubusercontent.com/76578159/117535860-b1a27700-b032-11eb-8699-4c60b5f6df0e.png">

## このアプリの目的とアプリを作成した理由

このアプリの目的は、備品データの管理や貸出管理を効率的かつ精度良くすることで、「**備品管理を担当する学生の負担をできるだけ削減すること**」です。

備品管理を担当するのは、基本的には、研究室に配属されたばかりの学生です。
現状、備品管理はEXCELファイルで行っていますが、管理ルールを定めても、配属されたばかりの学生はパソコンに不慣れで、データを管理する意識が低いため、どこかで必ずミスが生じます。
そのため、「精度の良い管理」をするためには時間が掛かりすぎてしまい、学生は、本来の目的である研究活動の時間を削減しなければならなくなります。  
さらに、現状では、EXCELファイルに登録できていない備品が未だ大量に残っているため、備品を完全に管理できるようになるまで時間が掛かりすぎてしまいます。  
したがって、学生の負担を削減し、研究活動に専念してもらうためには、効率的に精度の良い備品管理ができる仕組みを実現する必要がありました。

具体的に、学生の負担になっている要素・管理の精度を落とす要素は、以下の通りです。
- 複数人で同時にEXCELファイルを編集できないため、備品データを登録・編集するのに時間が掛かりすぎること
- 備品の貸出状況記入欄を設けているが、毎回記入するのが非常に煩わしいこと。また、過去の貸出記録を残すのが難しいこと
- 手打ちで直接EXCELファイルを編集するため、既存の備品データを変更してしまう恐れがあること
- 誰がいつファイルを編集したかが分からないこと

以上を解決するため、アカウント機能をもち、備品データ、貸出履歴、操作履歴などを一覧表示できる備品管理アプリを作成しようと考えました。

## アプリのURL
[https://equipments-management.herokuapp.com/](https://equipments-management.herokuapp.com/)  
※研究室内のローカルネットワークで実運用しているため、こちらはそのクローンとなっています。登録されている情報はダミーデータです。

## 開発環境
- Ruby 2.7.2
- Rails 6.1.3
- PostgreSQL 13.2
- HTML, CSS, jQuery
- Bootstrap4

## 機能一覧

| 実装内容 | 備考 |
----|---- 
| 新規登録、ログイン、ログアウト機能 | deviseで実装 |
| 備品データの一覧表示・詳細表示・追加・編集・削除機能 | - |
| 備品の貸出・返却機能 | 貸出ボタン・返却ボタンで貸出状況のステータスを変更 |
| 備品の貸出状況の一覧表示機能 | 現状貸出されている備品の一覧 |
| 備品の貸出履歴の一覧表示機能 | 貸出→返却された備品の一覧 |
| 操作履歴の一覧表示機能 | 備品データの追加・編集・削除、CSVエクスポートの履歴 |
| 検索機能 | kaminariで実装 |
| ソート機能 | kaminariで実装 |
| ページネーション機能 | kaminariで実装 |
| 備品データのCSVエクスポート機能 | 備品データの一覧を出力 |
| ゲストログイン機能 | deviseで実装 |
| 管理者権限機能 | 権限をもつユーザーのみ備品データの追加・編集・削除、CSVエクスポートが可能 |

## ER図・テーブル設計
<img width="635" alt="スクリーンショット 2021-05-08 19 27 36" src="https://user-images.githubusercontent.com/76578159/117535967-7fdde000-b033-11eb-96cb-173c456b0515.png">

usersテーブル:ユーザーデータのテーブル
| カラム名 | データ型 | 備考 |
----|----|---- 
| user_id | integer | PK |
| user_name | string | ユーザー名 |
| last_name | string | 苗字 |
| first_name | string | 名前 |
| assignment_year | integer | 研究室配属年度 |
| encrypted_password | string | 暗号化されたパスワード |
| reset_password_token | string | パスワードリセット時のトークン　|
| remember_created_at | datetime | Remember meのチェックボックス機能用 |
| created_at | datetime | - |
| updated_at | datetime | - |
| admin | boolean | 管理者権限の有無（true:有, false:無） |

equipmentsテーブル:備品データのテーブル
| カラム名 | データ型 | 備考 |
----|----|---- 
| equipment_id | integer | PK |
| genre | integer | 備品ジャンル |
| lab_equipment_name | string | 研究室用備品名 |
| maker_name | string | メーカー名 |
| product_name | string | 製品名 |
| purchase_year | integer | 購入年度 |
| asset_num | string | 資産番号 |
| price | integer | 値段 |
| remarks | text | 備考 |
| lendings_status | integer | 貸出状況（0:貸出可, 1:貸出中） |
| disposal_status | integer | 廃棄状況（0:未廃棄, 1:廃棄済） |
| created_at | datetime | - |
| updated_at | datetime | - |
| registered_user_id | integer | 備品を登録したユーザーのid（FK） |

lendingsテーブル:貸出した備品のテーブル
| カラム名 | データ型 | 備考 |
----|----|---- 
| lending_id | integer | PK |
| lending_user_id | integer | 備品を借りたユーザーのid(FK) |
| borrowed_equipment_id | integer | 貸出中の備品のid(FK) |
| return_time | timestamp | 備品を返却した日時 |
| created_at | datetime | - |
| updated_at | datetime | - |

operation_historiesテーブル:操作履歴テーブル
| カラム名 | データ型 | 備考 |
----|----|---- 
| operation_history_id | integer | PK |
| content | integer | 操作内容 |
| object | string | 操作対象 |
| operated_user_id | integer | 操作したユーザーのid(FK) |
| created_at | datetime | - |
| updated_at | datetime | - |

## 工夫した点・苦労した点

## 今後の課題
実際に研究室でこのアプリを運用し、学生からフィードバックをもらいました。それを踏まえて、現状の課題は以下の通りです。
(まだ運用できていないので、この部分は後日作成します。)
- 課題1
- 課題2
- 課題3
