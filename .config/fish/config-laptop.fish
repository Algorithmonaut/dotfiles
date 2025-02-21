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
