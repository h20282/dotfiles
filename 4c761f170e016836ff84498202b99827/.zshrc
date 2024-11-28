source ~/.zsh/antigen.zsh

antigen use oh-my-zsh

antigen theme agnoster

antigen bundle git


antigen apply

ZSH_THEME="agnoster"

alias cls="clear"
export PATH=$PATH:/home/ice/.local/bin

function replace {
    find . -name '*.h' -or -name '*.cpp'  | xargs sed -i $1
}

if [ ! -f ~/z.sh ]; then
    wget https://raw.githubusercontent.com/rupa/z/master/z.sh
fi
source ~/z.sh
