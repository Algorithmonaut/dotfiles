set -x MACHINE (cat ~/.config/fish/machine.txt)

if test "$MACHINE" = laptop
    source ~/.config/fish/config-laptop.fish
else if test "$MACHINE" = server
    source ~/.config/fish/config-server.fish
end

if status is-interactive

    set -g fish_greeting

    starship init fish | source
    zoxide init fish | source


    abbr --add s sudo
    abbr --add t task

    abbr --add l eza
    abbr --add ll eza -1Umlah
    abbr --add --position anywhere rm trash-put
    abbr --add --position anywhere rmf rm
    
    abbr --add rsync rsync -a --info=progress2 src dest 

    abbr --add yay 'yay --noconfirm'

    fish_vi_key_bindings
    set fish_cursor_default block # normal & visual mode
    set fish_cursor_insert block

    alias wget 'wget --hsts-file="$XDG_DATA_HOME/wget-hsts"'
end

function fish_greeting
    nerdfetch
end

# Created by `pipx` on 2025-03-02 19:45:59
set PATH $PATH /home/usr/.local/bin

set -Ux GRADLE_USER_HOME $HOME/.gradle

# Created by `pipx` on 2025-05-30 14:30:15
set PATH $PATH /home/user/.local/bin
