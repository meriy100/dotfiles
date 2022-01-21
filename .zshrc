#export LANG=ja_JP.utf8

#compinit -u

export TERM=xterm-256color
## 履歴の保存先
export HISTFILE=$HOME/.zsh-history
## メモリに展開する履歴の数
export HISTSIZE=1000000
## 保存する履歴の数
export SAVEHIST=1000000
## less のオプション
export LESS='-g -i -M -R -S -W -z-4 -x4'
export MORE='-g -i -M -R -S -W -z-4 -x4'
export PAGER='more -R'
# 重複を記録しない
setopt hist_ignore_all_dups
# ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_all_dups
# スペースで始まるコマンド行はヒストリリストから削除
setopt hist_ignore_space
# ヒストリを呼び出してから実行する間に一旦編集可能
setopt hist_verify
# 余分な空白は詰めて記録
setopt hist_reduce_blanks
# 古いコマンドと同じものは無視
setopt hist_save_no_dups
# historyコマンドは履歴に登録しない
setopt hist_no_store
# 補完時にヒストリを自動的に展開
setopt hist_expand
# 履歴をインクリメンタルに追加
setopt inc_append_history

## 履歴検索機能のショートカット設定(複数行履歴への対応)
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end

## 補完機能の強化
autoload -U compinit
compinit

## コアダンプサイズを制限
#limit coredumpsize 102400
## 出力の文字列末尾に改行コードが無い場合でも表示
unsetopt promptcr
## Emacsライクキーバインド設定
bindkey -e

## 色を使う
setopt prompt_subst
## ビープを鳴らさない
setopt nobeep
## 内部コマンド jobs の出力をデフォルトで jobs -l にする
setopt long_list_jobs
## 補完候補一覧でファイルの種別をマーク表示
setopt list_types
## サスペンド中のプロセスと同じコマンド名を実行した場合はリジューム
setopt auto_resume
## 補完候補を一覧表示
#setopt auto_list
## 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups
## cd 時に自動で push
setopt auto_pushd
## 同じディレクトリを pushd しない
setopt pushd_ignore_dups
## ファイル名で #, ~, ^ の 3 文字を正規表現として扱う
setopt extended_glob
## TAB で順に補完候補を切り替える
setopt auto_menu
## zsh の開始, 終了時刻をヒストリファイルに書き込む
setopt extended_history
## =command を command のパス名に展開する
setopt equals
## --prefix=/usr などの = 以降も補完
setopt magic_equal_subst
## ヒストリを呼び出してから実行する間に一旦編集
setopt hist_verify
## ファイル名の展開で辞書順ではなく数値的にソート
setopt numeric_glob_sort
## 出力時8ビットを通す
setopt print_eight_bit
## ヒストリを共有
setopt share_history
## 補完候補のカーソル選択を有効に
zstyle ':completion:*:default' menu select=1
# ## 補完候補の色づけ
# eval `dircolors`
export ZLS_COLORS=$LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
## ディレクトリ名だけで cd
setopt auto_cd
## カッコの対応などを自動的に補完
setopt auto_param_keys
## ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash
## スペルチェック
setopt correct
## {a-c} を a b c に展開する機能を使えるようにする
setopt brace_ccl
## Ctrl+S/Ctrl+Q によるフロー制御を使わないようにする
setopt NO_flow_control
## コマンドラインの先頭がスペースで始まる場合ヒストリに追加しない
setopt hist_ignore_space
## コマンドラインでも # 以降をコメントと見なす
setopt interactive_comments
## ファイル名の展開でディレクトリにマッチした場合末尾に / を付加する
setopt mark_dirs
## history (fc -l) コマンドをヒストリリストから取り除く。
setopt hist_no_store
## 補完候補を詰めて表示
setopt list_packed
## 最後のスラッシュを自動的に削除しない
setopt noautoremoveslash
## エイリアス使用時の補完を有効に
setopt complete_aliases
## プロンプトの設定

autoload colors
colors
#PROMPT="%{${fg[green]}%}[%n@%m] %(!.#.$) %{${reset_color}%}

PROMPT="%{${fg[blue]}%}%B[%n@%m]%b%{${reset_color}%}%{${fg[green]}%}%~%{${reset_color}%}
%(?|%{${fg[green]}%}🐰 |%{${fg[red]}%}💥 )>%{${reset_color}%}"

#%{${fg[green]}%}[%n] %(!.#.$) %{${reset_color}%}"
#%{${fg[yellow]}%}%[%n]$%{${reset_color}%}"
#PROMPT2="%{${fg[blue]}%}%_> %{${reset_color}%}"
#SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"
#RPROMPT="%{${fg[blue]}%}[%~]%{${reset_color}%}"

## RPROMPT

# DateTime
RPROMPT=""
RPROMPT=$RPROMPT"%*"

# CPU
if (( $+commands[arch] )); then
  RPROMPT=$RPROMPT'%{${fg[blue]}%}($(arch))%{${reset_color}%}'
fi

# Git Branch

autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

# ====

#C-S C-Q トラップ解除
stty -ixon -ixoff

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'


export EDITOR=vim        # エディタをvimに設定

set clipboard=unnamed,autoselect


[ -f ~/.zshrc.local ] && source ~/.zshrc.local
[ -f ~/.zshrc.alias ] && source ~/.zshrc.alias
[ -f ~/.zshrc.path ] && source ~/.zshrc.path




# w3m google検索

function google() {
local str opt
if [ $ != 0 ]; then
   for i in $*; do
     str="$str+$i"
   done
    str=`echo $str | sed 's/^\+//'`
 opt='search?num=50&hl=ja&lr=lang_ja'
    opt="${opt}&q=${str}"
fi
w3m http://www.google.co.jp/$opt
}

function cdu() {
  cd `git rev-parse --show-toplevel`
}


# neovim config
export XDG_CONFIG_HOME="$HOME/.config"

# installer path
export INSTALLER_PATH="$HOME/dotfiles/installer/"

### ghq and peco

function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^o' peco-src

### git branch and peco
function peco-src-git-branch () {
  local selected_branch=$(git branch -a | ruby -pe '$_.gsub!(/\*/, " ")' | ruby -pe '$_.gsub!(/#/, "\\#")' | grep -v 'HEAD -> ' | peco --query "$LBUFFER")
  if [ -n "$selected_branch" ]; then
    BUFFER="git checkout ${selected_branch}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src-git-branch
bindkey '^g' peco-src-git-branch



# source ~/.bin/tmuxinator.zsh

fpath=(~/.zsh/completion $fpath)
if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
export RUBY_CONFIGURE_OPTS="--with-readline-dir=$(brew --prefix readline)"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/meriy100/.nodebrew/node/v8.11.3/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/meriy100/.nodebrew/node/v8.11.3/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/meriy100/.nodebrew/node/v8.11.3/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/meriy100/.nodebrew/node/v8.11.3/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/meriy100/.nodebrew/node/v8.11.3/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/meriy100/.nodebrew/node/v8.11.3/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh

autoload -U +X bashcompinit && bashcompinit
# complete -o nospace -C /usr/local/bin/terraform terraform

# Docker autocomplete
if [ -e ~/.zsh/completions ]; then
  fpath=(~/.zsh/completions $fpath)
fi

autoload -U compinit
compinit

# terraform autocomplete : $ terraform -install-autocomplete
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/meriy100/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/meriy100/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/meriy100/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/meriy100/google-cloud-sdk/completion.zsh.inc'; fi
