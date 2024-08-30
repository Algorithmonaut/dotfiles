function n
  set notes_directory "$HOME/documents/notes/norg/"
  set note (find $notes_directory -type f -name "*.norg" | fzf)

  if test -n "$note"
    echo "$note" | xargs nvim
  else
    echo "No file selected."
  end
end

