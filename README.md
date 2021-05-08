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
<img width="636" alt="スクリーンショット 2021-05-08 19 06 51" src="https://user-images.githubusercontent.com/76578159/117535498-05ac5c00-b031-11eb-9762-5c405a7212a1.png">



## 工夫した点・苦労した点

## 今後の課題
実際に研究室でこのアプリを運用し、学生からフィードバックをもらいました。それを踏まえて、現状の課題は以下の通りです。
(まだ運用できていないので、この部分は後日作成します。)
- 課題1
- 課題2
- 課題3
