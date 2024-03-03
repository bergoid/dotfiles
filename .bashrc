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
export EDITOR=vim-x11

# Python debugging
export PYTHONBREAKPOINT="pudb.set_trace"

# Load local customization
test -f "$HOME/.bash.local" && . $_

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
# alias vi="vim-x11"
alias vi="nvim"
alias vim="vim-x11"
alias vimin="echo -n | vipe"
alias gtc="gtcommit"
alias s="git status"
alias unstage="git reset -- ."
# alias nv="nvim"

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

# Keybinding: Ctrl-y copies the current command line to the clipboard
if [[ -n $DISPLAY ]]; then
  copy_line_to_x_clipboard () {
    printf %s "$READLINE_LINE" | xclip -selection CLIPBOARD
  }
  bind -x '"\C-y": copy_line_to_x_clipboard'
fi

# Customize the bash command prompt
test -d "$HOME/tools/preppy/" && . preppy
