if status is-interactive
    set -x USER_SYSTEM_PATH "$HOME/system/"
    fish_add_path $USER_SYSTEM_PATH/scripts/ -pP
    fish_add_path $USER_SYSTEM_PATH/apps/ -pP

    if test "$TERM" = xterm-kitty
        alias ssh="kitten ssh"
    end

    theme_gruvbox dark medium

    abbr --add t task
    abbr --add --set-cursor v 'neovide ./%'

    abbr --add --set-cursor ff 'trans fr:fr "%"'
    abbr --add --set-cursor ee 'trans en:en "%"'
    abbr --add --set-cursor eses 'trans es:es "%"'
    abbr --add --set-cursor fe 'trans fr:en "%"'
    abbr --add --set-cursor ef 'trans en:fr "%"'
    abbr --add --set-cursor fes 'trans fr:es "%"'
    abbr --add --set-cursor esf 'trans es:fr "%"'

    abbr --add vr 'neovide oil-ssh://admin@server//server'
end

# CONF: Environment variables

# C: XDG
set -x XDG_DATA_HOME "$HOME/.local/share"
set -x XDG_CONFIG_HOME "$HOME/.config"
set -x XDG_STATE_HOME "$HOME/.local/state"
set -x XDG_CACHE_HOME "$HOME/.cache"

# C: Other
set -x HYPRSHOT_DIR "$HOME/documents/screenshots/"

if status is-interactive
    set -x EDITOR /sbin/neovide
    set -x DEBUGINFOD_URLS "https://debuginfod.archlinux.org"
    set -x MANPAGER "nvim +Man!"

end

set -x HISTFILE "$XDG_STATE_HOME/bash/history"
set -x CARGO_HOME "$XDG_DATA_HOME/cargo"
set -x CUDA_CACHE_PATH "$XDG_CACHE_HOME/nv"
set -x GNUPGHOME "$XDG_DATA_HOME/gnupg"
set -x GTK2_RC_FILES "$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
set -x LESSHISTFILE "$XDG_STATE_HOME/less/history"
set -x GTK2_RC_FILES "$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
set -x _JAVA_OPTIONS -Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
set -x XAUTHORITY "$XDG_RUNTIME_DIR/Xauthority"
set -x GOPATH "$XDG_DATA_HOME/go"
set -x GTK2_RC_FILES "$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
set -x GTK_IM_MODULE xim
