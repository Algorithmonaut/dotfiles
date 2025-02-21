if status is-interactive
    abbr --add v nvim
    abbr --add d docker compose
end

# CONF: Environment variables

# C: XDG
set -x XDG_DATA_HOME "$HOME/.local/share"
set -x XDG_CONFIG_HOME "$HOME/.config"
set -x XDG_STATE_HOME "$HOME/.local/state"
set -x XDG_CACHE_HOME "$HOME/.cache"

# C: Other
if status is-interactive
    set -x EDITOR /bin/nvim
    set -x MANPAGER "nvim +Man!"

end
