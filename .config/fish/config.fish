if status is-interactive
	set -g fish_greeting
	
	set -x USER_SYSTEM_PATH "$HOME/system/"

	fish_add_path $USER_SYSTEM_PATH/scripts/ -pP
	fish_add_path $USER_SYSTEM_PATH/apps/ -pP

  if test "$TERM" = "xterm-kitty"
    alias ssh="kitten ssh"
  end

	starship init fish | source
	zoxide init fish | source

  # enable_transience


  # fish_config theme choose rose-pine
  theme_gruvbox dark medium

	# test $TERM != "tmux-256color"; and exec tmux

	if type -q wget
		alias wget="wget --hsts-file=\"$XDG_DATA_HOME/wget-hsts\""
	end

	abbr --add s sudo
  abbr --add t task; abbr --add task t
	# abbr --add v nvim;
  abbr --add --set-cursor v 'neovide ./%'
  

  abbr --add b buku --suggest
	abbr --add l exa
	abbr --add ll exa -1la
	abbr --add --position anywhere rm trash-put
  abbr --add  --position anywhere rmf rm 

  abbr --add --set-cursor ff 'trans fr:fr "%"'
	abbr --add --set-cursor ee 'trans en:en "%"'
  abbr --add --set-cursor eses 'trans es:es "%"'
	abbr --add --set-cursor fe 'trans fr:en "%"'
	abbr --add --set-cursor ef 'trans en:fr "%"'
	abbr --add --set-cursor fes 'trans fr:es "%"'
	abbr --add --set-cursor esf 'trans es:fr "%"'

  abbr --add vr 'nvim oil-ssh://192.168.1.11/server'

  abbr --add yay 'yay --noconfirm'


	fish_vi_key_bindings
	set fish_cursor_default block # normal & visual mode
	set fish_cursor_insert block
end

function fish_greeting
	nerdfetch
end

# Created by `pipx` on 2024-05-02 23:15:08
set PATH $PATH /home/usr/.local/bin
