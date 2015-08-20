# マーケター版qiita(※アルファ版のため非公開

[![wercker status](https://app.wercker.com/status/4fb1528f45cd02cd430afc0cfad69e82/m "wercker status")](https://app.wercker.com/project/bykey/4fb1528f45cd02cd430afc0cfad69e82)

### Version

nukoでは以下のversionを使用しています。

```
ruby 2.2.0p0 (2014-12-25 revision 49005) [x86_64-darwin13]
Rails 4.2.0
```

## 事前準備 : How to start nuko

### 必須のcommand line toolsのインストール

https://developer.apple.com/downloads/index.action?name=for%20Xcode%20-

からcommand line toolsをダウンロードし、インストール。

開いてdialogが出てきたら全てOKする

# Homebrewのインストール

[Homebrew](http://brew.sh)というパッケージ管理システムをインストールします。
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

brew install autoconf phantomjs automake cmake gibo git imagemagick imagemagick-ruby186 libevent libiconv libmpc08 libpng libpng12 libtool libxml2 libxslt memcached mongodb mysql openssl python qt readline redis terminal-notifier zsh

brew cleanup # 掃除
```

全てインストールするの長いですが、辛抱

ImageMagickのインストールで詰まったら→ [Homebrewのちょっと前のFormulaを使うときにハマった](http://www.iwazer.com/~iwazawa/diary/2013/08/use-old-homebrew-formula.html)

### インストールしたFormulaがキチンとインストールされているかの確認コマンド
```
brew doctor # 医者
```

上記でエラー出たら文章の通りになおしていく、これが全て直してまでこれだけをやる、重要です。

# Ruby環境構築、rbenv, rubyインストール

### バージョン切り替えツールrbenvのインストール

ruby-buildはrbenvのpluginで、rbenvでrubyを簡単にインストールするのに必要なものです。

本来rbenvはrubyのバージョンを切り替えるのツールです

ruby-buildと組み合わせるとrubyのインストールが簡単に出来るようになります

```
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
~/.rbenv/plugins/ruby-build/install.sh
```

### 環境変数
使ってるのshell の .bash_profile or .zshrc

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
$ RUBY_CONFIGURE_OPTS="--enable-shared --with-readline-dir=$(brew --prefix readline) --with-openssl-dir=$(brew --prefix openssl)" rbenv install 2.2.0
```

最後のバージョン指定の所をプロジェクトで使っているバージョンに置換してください

### gemのpathの再読み込み

```
rbenv rehash
```

gemなどをインストールして、終わったら必ず上記のコマンドを打つ

### rubyの切り替え
```
rbenv global 2.2.0
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

## Projectの依存gemのインストール

```
bundle install --path=./vendor/bundle -j8
```

vendor/bundle以下にgemをインストール
`-j8`オプションをつけると早くインストール出来ます

### あるあるのnokogiriエラーの対処方法

```
bundle config build.nokogiri --use-system-libraries
```

でおｋ

## Projectの準備
一括でプロジェクトの準備してくれるscriptです。

```
./script/bootstrap.sh
```

## Project起動

```
./bin/rails s puma
```

`http://localhost:3000`でnukoが開けます

### How to run the spec

```
./bin/test-queue spec
```

単一でのテスト実行.

```
./bin/rspec spec/controllers/notes_controller_spec.rb:88  -n 3 # run only this spec's 88 line example
```

という感じにしてコマンドを生成しましょう。

# How to create Pull Request

1. 最新のソースコードを持ってきてからブランチを作る (`master` で `git pull --rebase` してから `git checkout <branch>`)
2. いろいろと変更を加える
3. 変更が終わったら、テストを実行してテストがすべて通るのを確認する (`rake spec`)
4. 変更中に `master` で発生した変更（差分）を持ってくる (作業中のブランチ で `git pull --rebase origin master` もしくは `git pull origin master`)
5. 再びテストを実行してテストがすべて通るのを確認する (`rake spec`)
6. `Pull Request` を送る :+1:

## RSpecの書き方
基本的に[betterspec](http://betterspecs.org/jp/)の書き方を採用する。
betterspecを参考にしspecを書きましょう。
