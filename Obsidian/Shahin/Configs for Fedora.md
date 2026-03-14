

**Dark Theme**
```bash
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
```

# Fedora Sway + Terminal Master Setup

## 1. Terminal Utilities & Bash
**Packages to install:**
```bash
# fzf for history search
sudo dnf install fzf

# eza for modern ls commands (requires COPR on Fedora)
sudo dnf copr enable alternateved/eza
sudo dnf install eza

```

**`~/.bashrc` Additions:**
# eza aliases
```bash
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
```
# fzf integration

```bash
eval "$(fzf --bash)"
```

### Corsair K70 Key Chatter Fix

Slows down the Wayland repeat delay to prevent mechanical switch bouncing (double-typing):

```bash
input "type:keyboard" {
    repeat_delay 300
    repeat_rate 30
}
```
### Monitor Layout & Refresh Rates
```bash
# Bottom Left: Philips 1080p
output HDMI-A-1 resolution 1920x1080@74.973Hz position 0 1440
workspace 4 output HDMI-A-1

# Top Center: Dell Ultrawide
output DP-3 resolution 3440x1440@99.982Hz position 1920 0
workspace 1 output DP-3

# Bottom Center: Dell Ultrawide
output DP-1 resolution 3440x1440@99.982Hz position 1920 1440
workspace 2 output DP-1

# Far Right: LG 240Hz (Vertical/Portrait)
output DP-2 resolution 1920x1080@240.001Hz transform 90 position 5360 0
workspace 3 output DP-2
```
### Dark Theme, OBS Portal
```bash
# Force Dark Mode & Wayland for GTK/Qt
set $gnome-schema org.gnome.desktop.interface
exec_always {
    gsettings set $gnome-schema gtk-theme 'Adwaita-dark'
    gsettings set $gnome-schema color-scheme 'prefer-dark'
}

# Screen Sharing Portal (Fixes black screen in OBS)
exec dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=sway

# Sleek Dark Window Colors
# class                 border  bground text    indicator child_border
client.focused          #5e81ac #4c566a #eceff4 #81a1c1   #5e81ac
client.focused_inactive #3b4252 #2e3440 #d8dee9 #4c566a   #4c566a
client.unfocused        #2e3440 #2e3440 #d8dee9 #3b4252   #2e3440
client.urgent           #bf616a #bf616a #eceff4 #bf616a   #bf616a
```

### QEMU / KVM Virtualization Setup

```bash
sudo dnf install @virtualization
sudo systemctl enable --now libvirtd
sudo usermod -aG libvirt $(whoami)
# Reboot after running these
```
