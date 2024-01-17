#
# ~/.bash_profile
#

# If on virtual terminal #1
if [ "$(tty)" = "/dev/tty1" ]; then

    # If no X yet
    if [ -z "$DISPLAY" ]; then

        # Start X. See .xinitrc for details
        startx

    fi

else

    # Source .bashrc
    [[ -f ~/.bashrc ]] && . ~/.bashrc

fi
