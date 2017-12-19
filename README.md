# e-Navigator で作って欲しいアプリケーションの説明

## セットアップ

### 事前にインストールしておいて欲しいもの
- ruby (version 2.4.3)
- Bundler
- PostgreSQL

### セットアップの手順

セットアップの手順は以下の通りです。

Github上でforkして、これから作るRailsアプリケーションの雛形をコピーします。
画面の右上にあるforkボタンを押すことで、自分のアカウントにこのアプリケーションをコピーしてくることができます。

![fork_button](https://github.com/feedforce/e-navigator/wiki/images/fork_button.jpg)

forkしたらローカルにcloneしておいてください。

次に、`$ bin/setup`を実行します。

最後に、`$ bundle exec rails s`してから、`http://localhost:3000`にアクセスしてください。

いつもの画面が表示されればセットアップは完了です。

![youre_on_rails](https://github.com/feedforce/e-navigator/wiki/images/youre_on_rails.png)

## 作って欲しいもの

面談の日程を調整するためのアプリケーションを作っていただきます。
そして、ここで作ったアプリケーションは、あなたの面談日程を調整するために実際に使います。
せっかく作ったアプリケーションが使われないのはもったいないですよね。
自分で作って自分で使って、ぜひ技術書をゲットしちゃってください！

### 詳細な説明
必要な機能の一覧は以下の通りです。

- ユーザー登録、ログイン機能
- 登録したユーザーのプロフィール編集機能
- 面談スケジュールの登録、編集、削除機能
- 面談スケジュールを知らせるためのメール送信機能
- 面談スケジュールを承認 or 非承認をできる機能
- 面談スケジュールの確定をお知らせするメール送信の機能

以下で詳しく説明します。

#### ユーザー登録、ログイン機能
ユーザーを新規登録できるようにし、その登録したユーザーでログインできるようにしてください。
ログインに必要な項目は以下のとおりです。

- メール
- パスワード

Railsチュートリアルではこのユーザー登録・ログイン機能の実装にほとんどの章を割いていますが、[devise](https://github.com/plataformatec/devise)というgemを使えば簡単に実装することができます。
また、他にも認証機能を実装できるgemはいくつかあります。
gemは何を使っても大丈夫ですし、もちろんフルスクラッチで実装しても良いです。ですが、今回はここはメインの機能ではないので、サクッと実装してもらうのが良いと思います。

#### 登録したユーザーのプロフィール編集機能
以下のプロフィールを登録・編集できるようにしてください。

- 名前
  - 文字列で作りましょう
- 生年月日
  - 生年月日を登録しておけば年齢が計算して表示できますね
- 性別
  - enumを使うと良いですね
- 学校名
  - 文字列で大丈夫です

**ここまでできたら前半は完了です！**
**レビューと今後のアドバイスをしますので、Herokuに途中までのアプリケーションをデプロイしてLINE等で教えてください！**

(後編は後ほど公開します。少々お待ち下さい。)

#### 面談スケジュールの登録、編集、削除機能

#### 面談スケジュールを知らせるためのメール送信機能

#### 面談スケジュールを承認 or 非承認をできる機能

#### 面談スケジュールの確定をお知らせするメール送信の機能

## このアプリを作る際に考慮しなくていいこと
以下のことは考慮しなくて大丈夫です。
もしも自分からやってきてくれた分にはきちんと見ますが、出来ていないからといってレビューなどに影響することはありません。

- 見た目(デザイン)
- 新機能の追加
- テスト(弊社ではRailsを開発する際には必ずテストを書きますが、ここでは必須ではありません。)

## Herokuにデプロイする
Herokuにデプロイする方法を簡単に書いておきます。

### Herokuにアカウントを作る
Herokuのアカウントを持っていない方は、まずはアカウントを作成してください。

https://www.heroku.com/

### Herokuをセットアップする
Heroku CLI がインストールされているかどうかを確認してください。

```
$ heroku version
```

上記のコマンドを打ってバージョンが表示されない方は Homebrew でインストールしてください。

```
$ brew install heroku/brew/heroku
```

Heroku CLIがインストールできたら、`heroku`コマンドでログインしてSSHキーを登録してください。

```
$ heroku login
$ heroku keys:add
```

ログインできたら、Herokuのサーバーにアプリケーションの実行場所を作りましょう。

```
$ heroku create
```

### Herokuにデプロイする
いよいよHerokuに登録したアプリケーションをデプロイしましょう。

```
$ git push heroku master
```

正しくデプロイできたか確認してみましょう。

```
$ heroku open
```

正しくアクセスできれば完了です。もし分からないことがあればお気軽に聞いてください。
