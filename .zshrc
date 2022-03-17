# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

# nodenv
eval "$(nodenv init -)"

# Starship
eval "$(starship init zsh)"

# alias
## ファイル・ディレクトリ関連
alias t='touch'
alias .='pwd'
alias md='mkdir'
# cd - で直前にいたディレクトリに戻れる
alias cd-='cd -'
# アプリ、URL、ファイル、finder(ディレクトリ)を開く
# ただファイルを開く。デフォルトで新しいインスタンスで開けるようにしておく。
# alias o='open'
alias o=op
# 新しいインスタンスでファイルを開く
alias op='open -n'
# アプリを指定してファイルを開く
alias opa='open -a'

## zsh
alias sz='source ~/.zshrc'
alias vz='vi ~/.zshrc'

## SSH
alias sshk='ssh-keygen -t rsa'
alias vsc='vi ~/.ssh/config'

## Node
alias n='node index.js'

### npm
alias ni='npm install'
alias nu='npm uninstall'
alias nr='npm run'

### yarn
alias ya='yarn add'
alias yr='yarn remove'
alias yi='yarn install'

## exa ls
### exaがインストールされている場合のみ、エイリアスを設定
if [[ $(command -v exa) ]]; then
  ### exaはlsをカラフルにしてくれるRust製コマンド
  ### --iconsでファイルタイプに応じたアイコンを表示
  ### ls → exa
  ### ls -l → exa -l
  ### ls -a → exa -aa
  ### ls -al → exa -aal
  alias e='exa --icons --git'
  alias l=e
  alias ls=e
  alias ea='exa -a --icons --git'
  alias la=ea
  ### いわゆるls -la
  alias ee='exa -aahl --icons --git'
  alias ll=ee
  ### 階層表示
  ### -Tオプションでツリー表示
  ### -Lで探索するディレクトリの深さを指定
  ### -Iでignore patternを指定
  ### .gitやnode_modulesなど特に表示しなくても良いディレクトリを無視
  alias et='exa -T -L 3 -a -I "node_modules|.git|.cache" --icons'
  alias lt=et
  ### lessで受け取る時は--color=alwaysを付けて、lessに-rオプションを付ける
  ### lessの中でもexaの色が反映
  alias eta='exa -T -a -I "node_modules|.git|.cache" --color=always --icons | less -r'
  alias lta=eta
  # ターミナルを一度消してls
  alias l='clear && ls'
fi

## rails
# bundle のみ。bundle installと同じ。
alias b='bundle install '
alias bi=b
# bundle init Gemfile生成
alias binit='bundle init'
alias birn="bundle install"
alias be='bundle exec'
#新しいRailsプロジェクトを作成
alias bern='bundle exec rails new . -T -d sqlite3'
alias r='bin/rails'
alias rs='bin/rails s'
alias rg='bin/rails g'
alias rc='bin/rails c'
# Rails Consoleのサンドボックスオプション
alias rcs='bin/rails c -s'
# alias rr='bin/rails r'
alias rd='bin/rails dbconsole'
alias rdm='bin/rails db:migrate'
# routes.rbの定義を確認
alias rr='bin/rails routes'

## git
alias g='git'
alias gs='git status'
alias gd='git diff'
# git add 特定
alias ga='git add'
# git add modifyのみ untrackedはそのまま
alias ga-u='git add -u'
### ブランチ一覧を表示
alias gb='git branch'
### 今いるブランチを確認する
alias gb-c='git branch --contains'
### ブランチを新しく切って移動
alias gco-b='git checkout -b'
### checkoutの後にブランチを指定してブランチを移動
alias gco='git checkout'
## コードをコミットする前のステージングに戻す
alias gco.='git checkout .'
### コメントを残してコミット
alias gc=gc-m
alias gc-m='git commit -m'
### リモートリポジトリのURLを確認する
alias grv='git remote -v'
### リモートリポジトリを追加。
alias gra='git remote add'
### リモートリポジトリに現在のブランチをプッシュ
alias gp='git push'

##VSCode
alias c='code -r'


## Fish対応
if [[ -o interactive ]]; then
    exec fish
fi
