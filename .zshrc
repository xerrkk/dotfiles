export PATH=$HOME/bin:$HOME/.local/bin:/opt/local/bin:/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin

# Neovim
#
if (( $+commands[nvim] )); then
    export EDITOR="nvim"
fi

# 2. Check if Emacs exists before setting it as Editor/Daemon
if (( $+commands[emacs] )); then
    export EDITOR="emacsclient -c"
    pgrep -u "$USER" -x emacs >/dev/null 2>&1 || emacs --daemon &
    alias vi='emacsclient -c'
    alias vim='emacsclient -c'
    alias nvim='emacsclient -c'
    alias e='emacsclient -c'
    alias v='emacsclient -c'
fi

# Nix
if [ -e /usr/local/etc/profile.d/nix.sh ]; then 
    . /usr/local/etc/profile.d/nix.sh
fi

# 3. Standard Shell Behavior
PROMPT='%F{cyan}%~%f $ '
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
setopt SHARE_HISTORY HIST_IGNORE_DUPS HIST_IGNORE_SPACE AUTO_CD
bindkey -v

# 4. Safer Aliases
alias xc="xclip -selection clipboard"
alias ls='ls -G'
alias ll='ls -alG'
alias dotfiles='cd ~/.dotfiles'
alias reload='source ~/.zshrc'

# Only alias sudo to doas if doas actually exists
if (( $+commands[doas] )); then
    alias sudo=doas
fi

# 5. Only source plugins if they exist
[[ -f ~/.zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source ~/.zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -f ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
