# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

eval "$(starship init bash)"

# --- fzf integration ---
eval "$(fzf --bash)"



# Basic listings
alias ls='eza --group-directories-first'
alias l='eza -1'
alias ll='eza -lg'
alias la='eza -la'

# Detailed listings
alias lld='eza -lg --group-directories-first'
alias llm='eza -lg --sort=modified'
alias lls='eza -lg --sort=size'
alias lla='eza -lag'

# Tree views
alias lt='eza --tree'
alias lta='eza --tree --all'
alias ltd='eza --tree --only-dirs'
alias lt2='eza --tree --level=2'
alias lt3='eza --tree --level=3'

# Special views
alias lx='eza -lbhHigUmuSa@ --time-style=long-iso'
alias lz='eza -lbGF --git'
alias lzd='eza -lbGF --git --sort=date'

# Git status
alias lg='eza --git-ignore'
alias lgi='eza --git'

# Color customization
export EZA_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

# Icons (if using terminal with Nerd Fonts)
alias lsi='eza --icons'
alias lli='eza -lg --icons'
alias lai='eza -la --icons'

# Combine with other commands
alias find-recent='eza -lg --sort modified --reverse | head'
alias find-large='eza -lg --sort size --reverse | head'

. "$HOME/.cargo/env"

alias cp='xcp'
