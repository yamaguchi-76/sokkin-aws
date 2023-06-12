# README

## versions

### ruby version 2.7.7
### rails version 6.1.7
### mysql version 8
[その他Gemfile参照](https://github.com/novelinc/sokkin-new/blob/master/Gemfile)

## gems
利用しているgemをいくつか列挙します

### 認証
devise: https://github.com/heartcombo/devise

### 動的フォーム
cocoon: https://github.com/nathanvda/cocoon

### csv出力
csb: https://github.com/aki77/csb


## 環境構築

1. コンテナを立ち上げる
```
$ docker-compose up -d --build
```

2. gem install & DBを作って初期データ投入
```
$ docker-compose exec web bundle install
$ docker-compose exec web rails db:drop db:create db:migrate db:seed
$ docker-compose exec web rake change_user_attributes:run 
```

3. ブラウザで開く
```
# toC
http://localhost:3000/users/sign_in

# toB
http://localhost:3000/companies/sign_in

# admin
http://localhost:3000/admins/sign_in
```

4. ログイン

各種アカウントはFactoryBotをもとに生成していますので、メールアドレス、パスワードはFactoryを参照
```
# toCアカウントのFactory
https://github.com/novelinc/sokkin-new/blob/master/spec/factories/users.rb

# toBアカウントのFactory
https://github.com/novelinc/sokkin-new/blob/master/spec/factories/companies.rb

# adminアカウントのFactory
https://github.com/novelinc/sokkin-new/blob/master/spec/factories/admins.rb
```

5. テスト/linter実行
```
# テスト実行
docker-compose exec web bundle exec rspec
# rubocop実行(linter)
docker-compose exec web bundle exec rubocop
```