export PATH=$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin
export EDITOR='nvim'

PROMPT='%F{cyan}%~%f $ '

HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
setopt SHARE_HISTORY         # Share history between sessions
setopt HIST_IGNORE_DUPS      # Don't record same command twice
setopt HIST_IGNORE_SPACE     # Don't record commands starting with a space

setopt AUTO_CD               # Just type the directory name to go there
bindkey -v

alias ls='ls -G'
alias ll='ls -alG'
alias dotfiles='cd ~/.dotfiles'
alias reload='source ~/.zshrc'
alias vi='nvim'
alias v='nvim'
