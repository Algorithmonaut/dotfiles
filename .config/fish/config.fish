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

    abbr --add l exa
    abbr --add ll exa -1la
    abbr --add --position anywhere rm trash-put
    abbr --add --position anywhere rmf rm

    abbr --add yay 'yay --noconfirm'

    fish_vi_key_bindings
    set fish_cursor_default block # normal & visual mode
    set fish_cursor_insert block
end

function fish_greeting
    nerdfetch
end
