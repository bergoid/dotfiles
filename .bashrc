# ~/.bashrc

# Aliases for non-interactive shells
alias xr="xargs -r -L 1"
alias xri="xargs -r -I '{}'" # '-I' Implies '-L 1'

# mkcd
function mkcd
{
  local dir="$*";
  mkdir -p "$dir" && cd "$dir";
}
export -f mkcd

# Tweak 'which' to match also aliases and functions
function which
{
    (alias; declare -f) | /usr/bin/which --tty-only --read-alias --read-functions --show-tilde --show-dot $@
}
export -f which

# Set editor command
export EDITOR=vim

# Python debugging
export PYTHONBREAKPOINT="pudb.set_trace"

# Load local customization
test -f "$HOME/.localConfig" && . $_

# If not running interactively, exit from this script
test -z "$PS1" && return

###################################
#                                 #
#      Interactive-only part      #
#                                 #
###################################

# Aliases
alias ls='ls --color=auto'
alias l='ls -l --group-directories-first --color=auto $*'
alias la='ls -la --group-directories-first --color=auto $*'
alias vi="vim"
alias vimin="echo -n | vipe"
alias s="git status"
alias unstage="git reset -- ."
#alias nvim="NVIM_APPNAME=nvim-vanilla nvim"
alias nv-ks="NVIM_APPNAME=nvim-kickstart nvim"
alias nv-lz="NVIM_APPNAME=nvim-lazyvim nvim"

function uncommit
{
    if [ "$(git rev-list --count origin/$(git branch --show-current)..HEAD)" -gt 0 ]; then
        git reset HEAD~1 --soft
    else
        echo ERROR: there are no unpushed commits >&2
        false
    fi
}
export -f uncommit

# Replace the current process with a tmux session
# if not already in a tmux session
if [ -z "$TMUX" ] && \
# and autostart of tmux is enabled
   [ "$LOCAL_TMUX_AUTOSTART" = "true" ] && \
# and autostart is not temporarily disabled
   [ ! -e /tmp/notmux ] && \
# and we are in a graphical GUI
   [ -n "$DISPLAY" ] && \
# and we are not root
   [ "$EUID" -ne 0 ]
# then start tmux
then
    tmuxScript="$HOME/tools/dotfiles/tmux2panes"
    [ -x "$tmuxScript" ] && exec "$tmuxScript"
fi

# Don't put duplicate lines in the history.
export HISTCONTROL=ignoredups:ignorespace

# Omit certain commands in history
export HISTIGNORE="l:ls:la:rm *:pwd:exit:bg:fg:s"

# append to the history file, don't overwrite it
shopt -s histappend

# Never truncate the history file
export HISTSIZE=-1
export HISTFILESIZE=-1

# Enable 256 color mode
#case $TERM in
#    xterm|screen)
#        TERM="${TERM}-256color" ;;
#esac
#TERM="screen-256color"

# Enable vim-style editing of the bash prompt
set -o vi
# but preserve original function of 'Ctrl-l'
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

# fzf keybindings for bash
if which fzf > /dev/null 2>&1; then
#     test -e /usr/share/fzf/key-bindings.bash && . $_
#     test -e /usr/share/fzf/completion.bash && . $_
    # Preserve original history search
    bind '"\C-r": reverse-search-history'
fi

# Keybinding: Ctrl-t cuts the current command line to the clipboard
#
# Didn't work. Maybe tmux/xclip issue?
#
# https://wiki.archlinux.org/index.php/Tmux#X_clipboard_integration
# https://askubuntu.com/questions/705620/xclip-vs-xsel/898094#898094
#
#bind -x '"\C-t":"\C-e\C-u xclip -selection clipboard << EOF\n\C-y\nEOF\n"'
#bind -x '"\C-t":echo hello'

# Customize the bash command prompt
test -d "$HOME/tools/preppy/" && . preppy
