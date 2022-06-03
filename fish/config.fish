if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
end

fish_add_path $HOME/go/bin
fish_add_path $HOME/.local/bin

alias nv="nvim"
alias btctl="bluetoothctl"
alias gs="git status"
alias gP="git push"
alias gp="git pull"
alias gc="git commit -m"
alias gca="git commit -am"
alias cd..="cd ../"
alias cd.="cd ../"
alias cls="clear"
alias lsl="ls -l"
alias lsa="ls -la"
alias icat="kitty +kitten icat"

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true
