#export LANG=ja_JP.utf8

#compinit -u

[ -f ~/.zshrc.base ] && source ~/.zshrc.base
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
[ -f ~/.zshrc.alias ] && source ~/.zshrc.alias
[ -f ~/.zshrc.path ] && source $HOME/.zshrc.path
[ -f ~/.zshrc.peco ] && source $HOME/.zshrc.peco


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

## 補完機能の強化
autoload -U compinit
compinit

# terraform autocomplete : $ terraform -install-autocomplete
complete -o nospace -C /opt/homebrew/bin/terraform terraform


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/meriy100/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/meriy100/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/meriy100/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/meriy100/google-cloud-sdk/completion.zsh.inc'; fi

# Initial mcfly (https://github.com/cantino/mcfly)
if type mcfly > /dev/null; then
  eval "$(mcfly init zsh)"
fi


if (which zprof > /dev/null 2>&1) ;then
  zprof
fi

