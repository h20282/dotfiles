if [ ! -d ~/.zsh ]; then
    mkdir ~/.zsh
fi

if [ ! -f ~/.zsh/antigen.zsh ]; then
    curl -L git.io/antigen > ~/.zsh/antigen.zsh
fi
source ~/.zsh/antigen.zsh

antigen use oh-my-zsh

antigen theme agnoster

antigen bundle git
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions


antigen apply

ZSH_THEME="agnoster"

alias cls="clear"
alias gz="tar -xvzf"
export PATH=$PATH:/home/ice/.local/bin

function replace {
    find . -name '*.h' -or -name '*.cpp'  | xargs sed -i $1
}

if [ ! -f ~/z.sh ]; then
    wget -O ~/z.sh https://raw.githubusercontent.com/rupa/z/master/z.sh
fi
source ~/z.sh
source ~/git-prompt.sh

# https://stackoverflow.com/questions/38136266/how-to-use-posh-git-bash-in-oh-my-zsh
RPROMPT='$(__posh_git_echo)'
