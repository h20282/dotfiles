source ~/.zsh/antigen.zsh

antigen use oh-my-zsh

antigen theme agnoster

antigen bundle git


antigen apply

ZSH_THEME="agnoster"

alias cls="clear"
source ~/.oh-my-zsh/plugins/incr/incr*.zsh

function replace {
    find . -name '*.h' -or -name '*.cpp'  | xargs sed -i $1
}
