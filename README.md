# マーケター版qiita

### Version

nukoでは以下のversionを使用しています。

```
ruby 2.1.3p242 (2014-09-19 revision 47630) [x86_64-darwin13.0]
Rails 4.1.4
```

## 事前準備 : How to start nuko

### 必須のcommand line toolsのインストール

https://developer.apple.com/downloads/index.action?name=for%20Xcode%20-

からcommand line toolsをダウンロードし、インストール。

開いてdialogが出てきたら全てOKする

# HomeBrewのインストール

http://brew.sh というパッケージ管理システムをインストールします。
brewのインストールに使うrubyのバージョンはなんでもいいので以下をコピーしてください

```
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
echo "export PATH=/usr/local/bin:$PATH" >> .bashrc # or .zshrc
exec $SHELL
which brew # ちゃんと入ってるか確認
```

### Tools and Libraryのインストール

ruby本体や、railsのgemなどで依存するやつをとりあえず多めにインストールします。
入れて損はしない

```
brew update # brew本体のうｐでと

brew install autoconf autojump phantomjs automake cmake gibo git imagemagick imagemagick-ruby186 libevent libiconv libmpc08 libpng libpng12 libtool libxml2 libxslt memcached mongodb mysql openssl python qt readline redis zsh

brew cleanup # 掃除
```

全てインストールするの長いですが、辛抱

ImageMagickのインストールで詰まったら→ [Homebrewのちょっと前のFormulaを使うときにハマった](http://www.iwazer.com/~iwazawa/diary/2013/08/use-old-homebrew-formula.html)

### インストールしたpackageがキチンとインストールされているかの確認コマンド
```
brew doctor # 医者
```

上記でエラー出たら文章の通りになおしていく、これが全て直してまでこれだけをやる、重要です。

# Ruby環境構築、rbenv, rubyインストール

### バージョン切り替えツールrbenvのインストール

ruby-buildはrbenvのpluginで、rbenvでrubyを簡単にインストールするのに必要なものです。

本来rbenvはrubyのバージョンを切り替えるだけのツールです

ruby-buildと組み合わせるとrubyのインストールが簡単に出来るようになります

```
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
~/.rbenv/plugins/ruby-build/install.sh
```

### 環境変数
あなたの使ってるのshell の .bash_profile or .zshrc

```
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init -)"
```

シェル再読み込み

```
exec $SHELL
```

### rubyのインストール

brewでインストールしたreadlineとopensslを使うprefixのoptionを追加します

```
$ RUBY_CONFIGURE_OPTS="--enable-shared --with-readline-dir=$(brew --prefix readline) --with-openssl-dir=$(brew --prefix openssl)" rbenv install 2.1.1
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

# github への公開鍵登録

~/.ssh/configに以下を追記

```~/.ssh/config
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

githubに登録 [github.com/settings/ssh](https://github.com/settings/ssh)
これで、pullやpush が全てパス無しでおｋになります

# nukoを動かす

## nukoを持ってくる

```
git clone git@github.com:sachin21/nuko.git
cd nuko
```

## projectの依存gemのインストール

```
bundle install --path=./vendor/bundle -j4
```

vendor/bundle以下にgemをインストール
`-j4`オプションをつけると早くインストール出来ます

### あるあるのnokogiriエラーの対処方法

```
bundle config build.nokogiri --use-system-libraries
```

でおｋ

## データベース作成

```
./bin/rake db:create
./bin/rake db:migrate
```

localのrakeやrailsのバージョンを使うために、bundle execをつけましょう。

## Project起動

```
bundle exec foreman start
```

`http://localhost:3000`でnukoが開けます

とでも追記して使いましょう。

### How to run the spec

```
./bin/rspec                  # run all specs too
./bin/rspec spec/controllers # run specs under spec/controllers
```

単一でのテスト実行.

```
./bin/rspec spec/controllers/questions_controller_spec.rb    # run only this spec
./bin/rspec spec/controllers/questions_controller_spec.rb:88 # run only this spec's 88 line example
```

という感じにしてコマンドを生成しましょう。

# How to create Pull Request

1. 最新のソースコードを持ってきてからブランチを作る (`master` で `git pull --rebase` してから `git checkout <branch>`)
2. いろいろと変更を加える
3. 変更が終わったら、テストを実行してテストがすべて通るのを確認する (`rake spec`)
4. 変更中に `master` で発生した変更（差分）を持ってくる (作業中のブランチ で `git pull --rebase origin master` もしくは `git pull origin master`)
5. 再びテストを実行してテストがすべて通るのを確認する (`rake spec`)
6. `Pull Request` を送る :+1:

# coding rules for nuko

変数展開しない（ダブルクォートを必要としない）場合には、シングルクォートを使う。

## coding

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

## spec

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
