#
# ~/.bash_profile
#


# Source .bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc

# If on virtual terminal #1
if [ "$XDG_VTNR" = "1" ]; then

    # If no X yet
    if [ -z "$DISPLAY" ]; then

        # Start X. See .xinitrc for details
        startx

    fi

fi
