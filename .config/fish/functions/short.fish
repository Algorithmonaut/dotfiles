function short
  set selection (find ~/_short -type l -printf "%f\n" | fzf)

  if test -z "$selection"
    return
  end

  set fullpath (realpath ~/_short/$selection)

  if test -d "$fullpath"
    cd "$fullpath"
  else
    echo "Selected symlink does not point to a directory: $fullpath"
  end
end

