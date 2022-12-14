function peco_select_history
  if test (count $argv) = 0
    set peco_flags --layout=bottom-up
  else
    set peco_flags --layout=bottom-up --query "$argv"
  end

  history | peco $peco_flags | read tmp

  if [ $tmp ]
    commandline $tmp
  else
    commandline ''
  end
end
