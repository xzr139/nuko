# マーケター版qiita

### Version

You have to use Ruby 2.0 or higher using `rvm` or `rbenv`.

```
ruby 2.0.0p481 (2014-05-08 revision 45883) [x86_64-darwin13.2.0]
Rails 4.1.1
```

## 事前準備 : How to start nuko

### 必須のcommand line toolsのインストール

```
xcode-select --install
```

### HomeBrewのインストール

```
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
which brew
```

### Tools and Libraryのインストール

```
brew update

brew install autoconf autojump phantomjs automake cmake gibo git imagemagick imagemagick-ruby186 libevent libiconv libmpc08 libpng libpng12 libtool libxml2 libxslt memcached mongodb mysql openssl python qt readline redis zsh

brew cleanup
```
ImageMagickのインストールで詰まったら→ [Homebrewのちょっと前のFormulaを使うときにハマった](http://www.iwazer.com/~iwazawa/diary/2013/08/use-old-homebrew-formula.html)

全てインストールするの長いですが、辛抱

### インストールしたpackageがキチンとインストールされているかの確認コマンド
```
brew doctor
```

↑でエラー出たら文章の通りになおしていく、これが全て直すまでこれだけをやる、重要です。


### Ruby環境構築、rbenv, rubyインストール

### バージョン切り替えツールrbenvのインストール
ruby-buildはrbenvのpluginで、rbenvでrubyをインストールするのに必要なもの
本来rbenvはrubyのバージョンを切り替えるだけのツールです

```
brew install rbenv ruby-build
```

### 環境変数
your shell の .bash_profile or .zshrc

```
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init -)"
```

```
exec $SHELL
```

シェル再読み込み

### rubyのインストール

brewでインストールしたreadlineとopensslを使うprefixのoptionを追加します

```
$ RUBY_CONFIGURE_OPTS="--enable-shared --with-readline-dir=$(brew --prefix readline) --with-openssl-dir=$(brew --prefix openssl)" rbenv install 2.0.0-p481
```

最後のバージョン指定の所をあなたのプロジェクトで使っているバージョンに置換してください

### gemのpathの再読み込み

```
rbenv rehash
```

↑gemなどをインストールして、終わったら必ずこのコマンドを打つ

### rubyの切り替え
```
rbenv global 2.0.0-p481
rbenv rehash
```

### 環境の確認（システムのものではなく、rbenvを指しているように）
```
$ which ruby
/Users/sachin21/.rbenv/shims/ruby
$ which gem
/Users/sachin21/.rbenv/shims/gem
$ which bundle
/Users/sachin21/.rbenv/shims/bundle
```

### 発生エラー
[nokogiri error](https://www.evernote.com/shard/s56/sh/fbea3379-33b0-41d3-adfd-8ca1df93ab8d/167d7a4bc12db04d8f30679ffd14e679)の解消方法、bundleに設定を付与

```
bundle config build.nokogiri --use-system-libraries
```


### github への公開鍵登録
```
Host github.com
  HostName github.com
  User            git
  IdentityFile         ~/.ssh/id_rsa
  PreferredAuthentications  publickey
```

鍵の作成 `ssh-keygen`コマンドを打って、全部空エンター

```
cat .ssh/id_rsa.pub | pbcopy
```
githubに登録 https://github.com/settings/ssh
これで、pull push が全てパス無しでおｋになります

### nukoを持ってくる

```
git clone git@github.com:sachin21/nuko.git
cd nuko
```

### projectの依存gemのインストール

```
bundle install --path=./vendor/bundle -j4
```

### データベース作成

```
bundle exec rake db:create
bundle exec rake db:migrate
```

localのrakeやrailsのバージョンを使うために、bundle execをつけましょう。
長いので.zshrcや.bash_profileに

### nuko起動

```
bundle exec foreman start
```

`http://localhost:3000`でnukoが起動出来ます

とでも追記して使いましょう。

### How to run the spec

```
rspec                  # run all specs too
rspec spec/controllers # run specs under spec/controllers
```

単一でのテスト実行.

```
rspec spec/controllers/questions_controller_spec.rb    # run only this spec
rspec spec/controllers/questions_controller_spec.rb:88 # run only this spec's 88 line example
```

### I18n

プロジェクトに文章を追加する方法

```config/locales/i18n.ja.yml
top_index:
  start_with_nuko:
    - Nukoをはじめる
```

### How to create Pull Request

1. 最新のソースコードを持ってきてからブランチを作る (`master` で `git pull --rebase` してから `git checkout <branch>`)
2. いろいろと変更を加える
3. 変更が終わったら、テストを実行してテストがすべて通るのを確認する (`rake spec`)
4. 変更中に `master` で発生した変更（差分）を持ってくる (作業中のブランチ で `git pull --rebase origin master` もしくは `git pull origin master`)
5. 再びテストを実行してテストがすべて通るのを確認する (`rake spec`)
6. `Pull Request` を送る :+1:

### Coding Rule

変数展開しない（ダブルクォートを必要としない）場合には、シングルクォートを使う。

bad
```ruby
:class => 'content'
%p=t('site.name')
names.each {|name| puts name}
```

good
```ruby
class: 'content'
%p= t('site.name')
names.each { |name| puts name }
```

Please refer to the following coding rules.
https://github.com/styleguide/ruby

### Naming Rule

```
質問する/した人 Questioner
回答する/した人 Answerer
最も参考になった回答 Featured answer
```

### Spec Coding Rule

shouldを使わず、expectを使う。

※ shouldだと不具合が出る事があるメソッドがある
[Qiita](http://qiita.com/awakia/items/d880250adc8cdbe7a32f)

bad
```
foo.should eq(bar)
foo.should_not eq(bar)
```

good
```
expect(foo).to eq(bar)
expect(foo).not_to eq(bar)
```

- ==の代わりにeq
- 正規表現関係の=~の代わりにmatch
- 配列の=~の代わりにmatch_array
