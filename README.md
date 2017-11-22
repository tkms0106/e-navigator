# e-Navigator で作って欲しいアプリケーションの説明

## セットアップの手順

セットアップの手順は以下の通りです。

Github上でforkして、これから作るRailsアプリケーションの雛形をコピーします。
画面の右上にあるforkボタンを押すことで、自分のアカウントにこのアプリケーションをコピーしてくることができます。

[写真]

次に、`bin/setup`を実行します。

最後に、`bundle exec rails s`してから、`http://localhost:3000`にアクセスしてください。

いつもの画面が表示されればセットアップは完了です。

[youre_on_rails]

## 作って欲しいもの

面談の日程を調整するためのアプリケーションを作っていただきます。
そして、ここで作ったアプリケーションは、あなたの面談日程を調整するために実際に使います。
せっかく作ったアプリケーションが使われないのはもったいないですよね。
自分で作って自分で使って、ぜひ技術書をゲットしちゃってください！

### 詳細な説明
必要な機能の一覧は以下の通りです。

- ユーザー登録、ログイン機能
- 登録したユーザーの編集機能
- 面談スケジュールの登録、編集、削除機能
- 面談スケジュールを知らせるためのメール送信機能
- 面談スケジュールを承認 or 非承認をできる機能
- 面談スケジュールの確定をお知らせするメール送信の機能

以下で詳しく説明します。

#### ユーザー登録、ログイン機能

#### 登録したユーザーの編集機能

#### 面談スケジュールの登録、編集、削除機能

#### 面談スケジュールを知らせるためのメール送信機能

#### 面談スケジュールを承認 or 非承認をできる機能

#### 面談スケジュールの確定をお知らせするメール送信の機能

### このアプリを作る際に考慮しなくていいこと
以下のことは考慮しなくて大丈夫です。
もしも自分からやってきてくれた分にはきちんと見ますが、出来ていないからといってレビューなどに影響することはありません。

- 見た目(デザイン)
- 新機能の追加
- テスト(弊社ではRailsを開発する際には必ずテストを書きますが、ここでは必須ではありません。)
