export PATH=$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin
export EDITOR="emacsclient -c"
PROMPT='%F{cyan}%~%f $ '
pgrep -u "$USER" -x emacs 2>/dev/null || emacs --daemon

HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
setopt SHARE_HISTORY         # Share history between sessions
setopt HIST_IGNORE_DUPS      # Don't record same command twice
setopt HIST_IGNORE_SPACE     # Don't record commands starting with a space

setopt AUTO_CD               # Just type the directory name to go there
bindkey -v

alias xc="xclip -selection clipboard"
alias ls='ls -G'
alias sudo=doas
alias ll='ls -alG'
alias dotfiles='cd ~/.dotfiles'
alias reload='source ~/.zshrc'
alias vim='emacsclient -c'
alias vi='emacsclient -c'
alias v='emacsclient -c'
alias e='emacsclient -c'
source ~/.zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
