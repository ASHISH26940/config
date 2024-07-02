 
alias cls=clear
alias v=vim
alias nv=nvim
alias f=fastfetch
alias pn=pnpm
alias cd=z

eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"

eval "$(zoxide init zsh)"

export PS1='%~%# '
